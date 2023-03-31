part of 'send_money_bloc.dart';

abstract class SendMoneyState extends Equatable {
  const SendMoneyState();
}

class SendMoneyInitial extends SendMoneyState {
  @override
  List<Object> get props => [];
}
