class FakeAccount {
  String taxCodeFake;
  String accountFake;
  String passwordFake;
  FakeAccount({
    required this.taxCodeFake,
    required this.accountFake,
    required this.passwordFake,
  });

  static FakeAccount fakeAccount = FakeAccount(
      taxCodeFake: '0123456789', accountFake: 'demo', passwordFake: '12345678');

  FakeAccount copyWith({
    String? taxCodeFake,
    String? accountFake,
    String? passwordFake,
  }) {
    return FakeAccount(
      taxCodeFake: taxCodeFake ?? this.taxCodeFake,
      accountFake: accountFake ?? this.accountFake,
      passwordFake: passwordFake ?? this.passwordFake,
    );
  }
}
