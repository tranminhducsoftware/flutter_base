class ApiPath {
  //config host
  static const String host_dev = "https://todo.368up.com/api";

  // login
  static const String refreshTokenUrl = host_dev + "/TokenAuth/RefreshToken";
  static const String loginUrl = host_dev + "/TokenAuth/Authenticate";
  static const String tenantAllUrl = host_dev + "/services/app/FollowWorkExtend/GetAllTenant";
  static const String UpdateDeviceTokenByUserUrl = host_dev + "/services/app/FollowWorkExtend/UpdateDeviceTokenByUser";
  static const String GetCurrentUserProfileForEditUrl = host_dev + "/services/app/Profile/GetCurrentUserProfileForEdit";

  // employee
  static const String employeeUrl = host_dev + "/services/app/Employee/GetAll";

  // work
  static const String workUrl = host_dev + "/services/app/Work/";
  static const String projectUrl = host_dev + "/services/app/Project/";
  static const String workStepUrl = host_dev + "/services/app/ProjectStep/";
  static const String selectProjectUrl = host_dev + "/services/app/FollowWork/SelectProject";
  // host
  static const String hostUrl = host_dev;

}