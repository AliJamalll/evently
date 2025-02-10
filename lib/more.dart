// FutureBuilder<List<EventDataModel>>(
//     future: FirebaseFireStoreService.getDataFromFireStore(),
//     builder: (context, snapshot) {
//       if (snapshot.hasError) {
//         return Text("Something went wrong");
//       }
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator(
//           color: AppColors.purple,
//         );
//       }
//       List<EventDataModel> eventDataModel = snapshot.data ?? [];
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           height: height.h,
//           child: eventDataModel.isEmpty
//               ? Text("No Events Created yet")
//               : ListView.separated(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: eventDataModel.length,
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context, index) {
//               return CustomListViwEvents(
//                 eventDataModel: eventDataModel[index],
//               );
//             },
//             separatorBuilder: (context, index) => SizedBox(
//               height: 10.h,
//             ),
//           ),
//         ),
//       );
//     }),
