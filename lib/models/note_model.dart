class NoteModel {
  String? title;
  String? dateTime;
  String? body;
  int? id;

  NoteModel({this.body, this.dateTime, this.title, this.id});

  NoteModel.fromDatabase(Map map) {
    id = map["id"];
    title = map["title"];
    body = map["body"];
    dateTime = map["dateTime"];
  }

//   static List<NoteModel> notes = [
//     NoteModel(
//       body:
//           """Lorem ipsum dolor sit amet. Et soluta quia et quae necessitatibus eos assumenda itaque aut quae explicabo non magni voluptatum qui voluptates consectetur. Hic aliquid possimus est provident voluptatem ut blanditiis dolores non dolores quia cum cupiditate excepturi eum eligendi distinctio qui numquam porro. Et velit possimus ea numquam velit et deleniti aliquam vel similique dignissimos sit temporibus alias sed consequatur voluptas et numquam dignissimos. Qui itaque porro sed deleniti quisquam ut omnis voluptatem ex assumenda voluptatem quo minima tempora 33 consequatur beatae eum animi consequuntur.
// Aut neque inventore At quos enim et quas quisquam et corporis eius qui corporis magni. Aut libero quam ut iusto voluptas est porro nisi a omnis unde aut beatae accusamus. Aut nihil porro et debitis suscipit eum officia excepturi.
// Eos voluptatum velit sed omnis voluptatem id accusamus illum ut porro provident. Non delectus quaerat ut fugit rerum vel doloribus perspiciatis aut dolorum rerum. Cum eaque dolore sit veniam facere et consequuntur consequatur non impedit consectetur. Aut esse atque quo autem placeat et vero placeat et voluptates rerum et praesentium reiciendis ab veniam maxime ut obcaecati dolore!""",
//       dateTime: DateTime.now().toString(),
//       title: "expenses",
//     ),
//     NoteModel(
//       body:
//           """Lorem ipsum dolor sit amet. Et soluta quia et quae necessitatibus eos assumenda itaque aut quae explicabo non magni voluptatum qui voluptates consectetur. Hic aliquid possimus est provident voluptatem ut blanditiis dolores non dolores quia cum cupiditate excepturi eum eligendi distinctio qui numquam porro. Et velit possimus ea numquam velit et deleniti aliquam vel similique dignissimos sit temporibus alias sed consequatur voluptas et numquam dignissimos. Qui itaque porro sed deleniti quisquam ut omnis voluptatem ex assumenda voluptatem quo minima tempora 33 consequatur beatae eum animi consequuntur.
// Aut neque inventore At quos enim et quas quisquam et corporis eius qui corporis magni. Aut libero quam ut iusto voluptas est porro nisi a omnis unde aut beatae accusamus. Aut nihil porro et debitis suscipit eum officia excepturi.
// Eos voluptatum velit sed omnis voluptatem id accusamus illum ut porro provident. Non delectus quaerat ut fugit rerum vel doloribus perspiciatis aut dolorum rerum. Cum eaque dolore sit veniam facere et consequuntur consequatur non impedit consectetur. Aut esse atque quo autem placeat et vero placeat et voluptates rerum et praesentium reiciendis ab veniam maxime ut obcaecati dolore!""",
//       dateTime: DateTime.now().toString(),
//       title: "expenses",
//     ),
//     NoteModel(
//       body:
//           """Lorem ipsum dolor sit amet. Et soluta quia et quae necessitatibus eos assumenda itaque aut quae explicabo non magni voluptatum qui voluptates consectetur. Hic aliquid possimus est provident voluptatem ut blanditiis dolores non dolores quia cum cupiditate excepturi eum eligendi distinctio qui numquam porro. Et velit possimus ea numquam velit et deleniti aliquam vel similique dignissimos sit temporibus alias sed consequatur voluptas et numquam dignissimos. Qui itaque porro sed deleniti quisquam ut omnis voluptatem ex assumenda voluptatem quo minima tempora 33 consequatur beatae eum animi consequuntur.
// Aut neque inventore At quos enim et quas quisquam et corporis eius qui corporis magni. Aut libero quam ut iusto voluptas est porro nisi a omnis unde aut beatae accusamus. Aut nihil porro et debitis suscipit eum officia excepturi.
// Eos voluptatum velit sed omnis voluptatem id accusamus illum ut porro provident. Non delectus quaerat ut fugit rerum vel doloribus perspiciatis aut dolorum rerum. Cum eaque dolore sit veniam facere et consequuntur consequatur non impedit consectetur. Aut esse atque quo autem placeat et vero placeat et voluptates rerum et praesentium reiciendis ab veniam maxime ut obcaecati dolore!""",
//       dateTime: DateTime.now().toString(),
//       title: "expenses",
//     ),
//     NoteModel(
//       body:
//           """Lorem ipsum dolor sit amet. Et soluta quia et quae necessitatibus eos assumenda itaque aut quae explicabo non magni voluptatum qui voluptates consectetur. Hic aliquid possimus est provident voluptatem ut blanditiis dolores non dolores quia cum cupiditate excepturi eum eligendi distinctio qui numquam porro. Et velit possimus ea numquam velit et deleniti aliquam vel similique dignissimos sit temporibus alias sed consequatur voluptas et numquam dignissimos. Qui itaque porro sed deleniti quisquam ut omnis voluptatem ex assumenda voluptatem quo minima tempora 33 consequatur beatae eum animi consequuntur.
// Aut neque inventore At quos enim et quas quisquam et corporis eius qui corporis magni. Aut libero quam ut iusto voluptas est porro nisi a omnis unde aut beatae accusamus. Aut nihil porro et debitis suscipit eum officia excepturi.
// Eos voluptatum velit sed omnis voluptatem id accusamus illum ut porro provident. Non delectus quaerat ut fugit rerum vel doloribus perspiciatis aut dolorum rerum. Cum eaque dolore sit veniam facere et consequuntur consequatur non impedit consectetur. Aut esse atque quo autem placeat et vero placeat et voluptates rerum et praesentium reiciendis ab veniam maxime ut obcaecati dolore!""",
//       dateTime: DateTime.now().toString(),
//       title: "expenses",
//     ),
//     NoteModel(
//       body:
//           """Lorem ipsum dolor sit amet. Et soluta quia et quae necessitatibus eos assumenda itaque aut quae explicabo non magni voluptatum qui voluptates consectetur. Hic aliquid possimus est provident voluptatem ut blanditiis dolores non dolores quia cum cupiditate excepturi eum eligendi distinctio qui numquam porro. Et velit possimus ea numquam velit et deleniti aliquam vel similique dignissimos sit temporibus alias sed consequatur voluptas et numquam dignissimos. Qui itaque porro sed deleniti quisquam ut omnis voluptatem ex assumenda voluptatem quo minima tempora 33 consequatur beatae eum animi consequuntur.
// Aut neque inventore At quos enim et quas quisquam et corporis eius qui corporis magni. Aut libero quam ut iusto voluptas est porro nisi a omnis unde aut beatae accusamus. Aut nihil porro et debitis suscipit eum officia excepturi.
// Eos voluptatum velit sed omnis voluptatem id accusamus illum ut porro provident. Non delectus quaerat ut fugit rerum vel doloribus perspiciatis aut dolorum rerum. Cum eaque dolore sit veniam facere et consequuntur consequatur non impedit consectetur. Aut esse atque quo autem placeat et vero placeat et voluptates rerum et praesentium reiciendis ab veniam maxime ut obcaecati dolore!""",
//       dateTime: DateTime.now().toString(),
//       title: "expenses",
//     ),
//   ];


}
