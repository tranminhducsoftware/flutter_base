class ApiPath {
  //config host
  static const String HOST_DEV = "https://todo.368up.com/api";

  // login
  static const String refreshTokenUrl = HOST_DEV + "/TokenAuth/RefreshToken";
  static const String loginUrl = HOST_DEV + "/TokenAuth/Authenticate";
  static const String tenantAllUrl = HOST_DEV + "/services/app/FollowWorkExtend/GetAllTenant";
  static const String UpdateDeviceTokenByUserUrl = HOST_DEV + "/services/app/FollowWorkExtend/UpdateDeviceTokenByUser";
  static const String GetCurrentUserProfileForEditUrl = HOST_DEV + "/services/app/Profile/GetCurrentUserProfileForEdit";

  // employee
  static const String employeeUrl = HOST_DEV + "/services/app/Employee/GetAll";

  // work
  static const String workUrl = HOST_DEV + "/services/app/Work/";
  static const String projectUrl = HOST_DEV + "/services/app/Project/";
  static const String workStepUrl = HOST_DEV + "/services/app/ProjectStep/";
  static const String selectProjectUrl = HOST_DEV + "/services/app/FollowWork/SelectProject";

  // host
  static const String HOST_URL = HOST_DEV;

}