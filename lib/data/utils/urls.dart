class Urls {
  Urls._();

   static const String _baseUrl = "http://20.239.87.34:8080";
  static String signup = "$_baseUrl/signup";
  // static String profileUpdate = "$_baseUrl/profileUpdate";
  static String login = "$_baseUrl/login";
  // static String createTask = "$_baseUrl/createTask";
  // static String summaryCardCount = "$_baseUrl/taskStatusCount";
  // static String newListTasks = "$_baseUrl/listTaskByStatus/New";
  // static String completeListTasks = "$_baseUrl/listTaskByStatus/Completed";
  // static String cancelListTasks = "$_baseUrl/listTaskByStatus/Cancelled";
  // static String inProgressListTasks = "$_baseUrl/listTaskByStatus/In Progress";
  // static String deleteListTasks(String id) => "$_baseUrl/deleteTask/$id";
  // static String updateTasksStatus(String id, String status) =>
  //     "$_baseUrl/updateTaskStatus/$id/$status";
  // //! update task api not available
  // // static String updateListTasks(String id) =>
  // //     "$_baseUrl/noUrlProvidedInApi/$id";
  static String sendOtpToEmail(String email) =>
      "$_baseUrl/RecoverVerifyEmail/$email";
  // static String verifyOtpToEmail(String email, otp) =>
  //     "$_baseUrl/RecoverVerifyOTP/$email/$otp";
  // static String resetPassword = "$_baseUrl/RecoverResetPass";
}
