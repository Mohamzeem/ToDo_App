import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/view/task/screens/completed_tasks_page.dart';
import 'package:todo_app/view/drawer/drawer_view.dart';
import 'package:todo_app/view/task/screens/favorite_tasks_page.dart';
import 'package:todo_app/view/task/task_widgets/add_task.dart';
import 'pending_tasks_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});
  static const id = 'tabs_page';

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, dynamic>> pagesList = [
    {'pageName': const PendingTasksPage(), 'pageTitle': 'Pending Tasks'},
    {'pageName': const CompletedTasksPage(), 'pageTitle': 'Completed Tasks'},
    {'pageName': const FavoriteTasksPage(), 'pageTitle': 'Favorite Tasks'},
  ];

  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      appBar: _appBar(context),
      drawer: const MyDrawer(),
      body: pagesList[selectedPageIndex]['pageName'],
      floatingActionButton: selectedPageIndex == 0
          ? _floatingActionBtn(() => _addTask(context))
          : null,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
        title: Text(
          pagesList[selectedPageIndex]['pageTitle'],
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          selectedPageIndex == 0
              ? IconButton(
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add))
              : Container()
        ],
      );

  FloatingActionButton _floatingActionBtn(void Function() onPressed) =>
      FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: (value) {
          setState(() {
            selectedPageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Pending Tasks',
              icon: Icon(Icons.incomplete_circle_outlined)),
          BottomNavigationBarItem(
              label: 'Completed Tasks', icon: Icon(Icons.done_outline)),
          BottomNavigationBarItem(
              label: 'Favorite Tasks', icon: Icon(Icons.favorite_outline)),
        ],
      );

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const AddTask(),
            ),
          ),
        );
      },
    );
  }
}
