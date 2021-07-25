enum AppStatus { empty, loading, success, error }

extension stateMessage on AppStatus {
  String message() {
    if (this == AppStatus.error) {
      return "Ops! Algo deu errado";
    }

    return "";
  }
}

extension format on double {
  String reais() {
    return "R\$ ${this.toStringAsFixed(2)}".replaceAll(".", ",");
  }
}
