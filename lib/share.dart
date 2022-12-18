//
// class SharedHelper
// {
//
//   static SharedHelper? sharedhelper;
//   static init()async
//   {
//     sharedhelper=await sharedhelper?.getInstance();
//   }
//   Future<bool> put({
//   required String key,
//     required bool value,
// })async
//     {
//   return await sharedhelper.setBool(key,value);
//
//     }
// }