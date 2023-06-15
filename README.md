# TaskBook - приложение для контроля ваших задач!!!

## Скачать приложение

[download TaskBook.apk](https://github.com/Greatest4Ce/toDoListY/releases/tag/v1.0.0)

## Основные функции:

- Отображение списка ваших задач: на основной странице вы увидите список ваших задач. Каждая задача будет включать себя текст задачи, приоритет и дату, до которой ее нужно выполнить.
- Добавление новой заметки: для создания новой заметки вы можете нажать на кнопку «+» или нажать на поле «новое» в конце списка. Далее вы перейдете на страницу для создания задачи, в которой обязательным для сохранения задачи является поле для текста.
- Также, вы в любой момент можете редактировать задачу. Для это тапните на задачу и перейдите в окно редактирования, в котором вы сможете поменять интересующие вас поля.

## Интерфейс приложения:

<img width="361" alt="Снимок экрана 2023-06-15 в 23 59 17" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/1e75ba07-57f4-4891-8aee-add8ec50765f">
<img width="361" alt="Снимок экрана 2023-06-15 в 23 59 23" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/b44be221-0ee8-4ce0-b83f-bd05396cf856">
<img width="361" alt="Снимок экрана 2023-06-15 в 23 59 32" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/0d15d46b-729b-4f97-8c1c-5050db71ab32">
<img width="361" alt="Снимок экрана 2023-06-16 в 00 01 27" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/81b393ec-48f4-44ad-92e5-4a56d2b270ef">
<img width="361" alt="Снимок экрана 2023-06-16 в 00 01 37" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/6e214321-fdcc-41cb-9811-349d7aab2f33">

## Использованные зависимости
``` dart

version: 1.0.0+1

environment:
  sdk: ">=2.17.5 <3.0.0"


dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.17.0
  provider: ^6.0.5
  ```
  
  
## Файловая структура:

```dart
  - lib
    - domain
      - state // stateManagement
      - model // Модель task
      - routes // навигация
    - presentation
      - screens // Страницы
      - feature // Виджеты относящиеся к странице
      - style // Стили, темы, цвета
```
## Примеры кода:

TaskModel

```dart
    class TaskModel {
  String id;
  String status;
  String taskText;
  String priority;
  String deadline;
  TaskModel(
      {required this.id,
      required this.status,
      required this.taskText,
      required this.priority,
      required this.deadline});
}
```
Сохранение изменений задания

```
void savetask(id) {
    _tasks[_tasks.indexWhere((e) => e.id == id)] = _task;
    notifyListeners();
    dev.log('Сохранены изменения в задании с id: $id');
  }
```  

MaterialApp

```
MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', 'RU')],
      themeMode: ThemeMode.light,
      theme: themes.lightTheme,
      darkTheme: themes.darkTheme,
      initialRoute: RouteNames.home,
      routes: RoutesBuilder.routes,
      navigatorKey: NavigationManager.instance.key,
    );
```    
