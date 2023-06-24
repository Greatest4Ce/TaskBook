# TaskBook - приложение для контроля ваших задач!!!

![appstore — малый размер](https://github.com/Greatest4Ce/TaskBook/assets/108977645/389f9fb1-d7f9-4ef8-899d-9eaebd267642)


## Скачать приложение

[download TaskBook.apk](https://github.com/Greatest4Ce/toDoListY/releases/tag/v1.0.0)

## Основные функции:

- Отображение списка ваших задач: на основной странице вы увидите список ваших задач. Каждая задача будет включать себя текст задачи, приоритет и дату, до которой ее нужно выполнить.
- Добавление новой заметки: для создания новой заметки вы можете нажать на кнопку «+» или нажать на поле «новое» в конце списка. Далее вы перейдете на страницу для создания задачи, в которой обязательным для сохранения задачи является поле для текста.
- Также, вы в любой момент можете редактировать задачу. Для это тапните на задачу и перейдите в окно редактирования, в котором вы сможете поменять интересующие вас поля.

## Интерфейс приложения:

# Светлая тема
<img width="361" alt="Снимок экрана 2023-06-15 в 23 59 17" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/1e75ba07-57f4-4891-8aee-add8ec50765f">
<img width="361" alt="Снимок экрана 2023-06-15 в 23 59 23" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/b44be221-0ee8-4ce0-b83f-bd05396cf856">
<img width="361" alt="Снимок экрана 2023-06-15 в 23 59 32" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/0d15d46b-729b-4f97-8c1c-5050db71ab32">
<img width="361" alt="Снимок экрана 2023-06-16 в 00 01 27" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/81b393ec-48f4-44ad-92e5-4a56d2b270ef">
<img width="361" alt="Снимок экрана 2023-06-16 в 00 01 37" src="https://github.com/Greatest4Ce/toDoListY/assets/108977645/6e214321-fdcc-41cb-9811-349d7aab2f33">

# Темная тема

<img width="368" alt="Снимок экрана 2023-06-24 в 06 26 08" src="https://github.com/Greatest4Ce/TaskBook/assets/108977645/fbd2f911-20fb-4849-aab9-7f6cfd87451f">
<img width="368" alt="Снимок экрана 2023-06-24 в 06 26 12" src="https://github.com/Greatest4Ce/TaskBook/assets/108977645/6825b37b-b88f-4170-9022-07aff0d9f52b">


## Использованные зависимости
``` dart

version: 1.0.0+1

environment:
  sdk: ">=2.17.5 <3.0.0"


dependencies:
  connectivity: ^3.0.2
  dio: ^5.2.1+1
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  flutter_mobx: ^2.0.6+5
  get_it: ^7.6.0
  intl: ^0.17.0
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  mobx: ^2.2.0
  mobx_codegen: ^2.3.0
  path_provider: ^2.0.15
  provider: ^6.0.5
  shared_preferences: ^2.1.1
  uuid: ^3.0.7
  ```
  
  
## Файловая структура:

```dart
  - l10n // Файлы локализации
  - lib
    - data
      - local_storage
        - models // Модели для Isar
        - repository
        - request // Формирование Isar модели
        local_storage_util // Взаимодействие с локальным хранлищем
      - server
        - mapper // преобразование из Апи
        - models // Апи модели
        - repository
        - request  // формирование тела запроса
        - service // функции запросов к серверу
        api_util // запросы к серверу
    - domain
      - state // stateManagement
      - model // Модель task
      - routes // навигация
    - internal // Зависимости  
    - presentation
      - screens // Страницы
      - feature // Виджеты относящиеся к страниц
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

Get запрос к серверу

```
  Future<ApiTaskList> getTasks() async {
    final response = await _dioGetter.get<Map<String, dynamic>>(_url);
    if (response.statusCode == 200) {
      final data = response.data;
      if (data != null) {
        revision = data["revision"];
        log('Задачи получены с сервера');
        return ApiTaskList.fromApi(data["list"]);
      }
    }
    throw ArgumentError();
  }
```

Преорбразование данных полученных с сервера в TaskModel

```
class TaskMapper {
  static TaskModel fromJson(ApiTask task) {
    return TaskModel(
        id: task.id.toString(),
        done: task.done,
        text: task.text.toString(),
        importance: task.importance,
        deadline: task.deadline,
        createdAt: task.createdAt,
        changedAt: task.createdAt,
        lastUpdatedBy: task.lastUpdatedBy);
  }
}
```
