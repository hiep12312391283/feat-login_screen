// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    taxCodeFake: '1111111111', accountFake: 'demo', passwordFake: '12345678');
}
