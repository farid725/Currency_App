class ApiResponse<T> {
  Status status;
  T? data;
  String? message;
  ApiResponse.initial(this.message):status = Status.INITIAL;
  ApiResponse.loading(this.message):status = Status.LOADING;
  ApiResponse.succes(this.data):status = Status.SUCCES;
  ApiResponse.error(this.message):status = Status.ERROR;
}

enum Status { INITIAL, LOADING, SUCCES, ERROR }