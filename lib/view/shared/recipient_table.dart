import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/repositories/transaction_repository.dart';
import 'package:kawereeze/view/index.dart';

import '../../blocs/transaction/transaction_bloc.dart';
import '../../model/user.dart';
import '../../theme/theme.dart';
import '../../utils/custom_alerts.dart';
import '../widget/kw_table.dart';
import '../widget/kw_title.dart';

class RecipientTable extends StatelessWidget {
  const RecipientTable({Key? key, required this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: size20, right: size20, top: size10, bottom: size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const KwTitle(
            type: 'table-heading',
            title: 'Recent Transactions',
          ),
          const SizedBox(
            height: size5,
          ),
          Container(
            height: MediaQuery.of(context).size.height - size250,
            padding: const EdgeInsets.only(bottom: 45),
            child: SingleChildScrollView(
              child: BlocProvider<TransactionBloc>(
                create: (transactionContext) => TransactionBloc(
                    transactionRepository: TransactionRepository())
                  ..add(GetTransactionsEvent(userId: user?.id)),
                child: BlocConsumer<TransactionBloc, TransactionState>(
                  listener: (transactionContext, state) {
                    if (state.uiState == TransactionUIState.LOADING) {
                      CustomAlerts().asyncSimpleAlertDialog(
                          alignment: Alignment.center,
                          context: transactionContext,
                          children: [
                            CustomAlerts().alertDialog(
                              context: transactionContext,
                              loader: const CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                              title: "Wait",
                              subtitle: 'Loading transactions ...',
                              type: "table-heading",
                            )
                          ]);
                    } else if (state.uiState == TransactionUIState.FAILED) {
                      Navigator.of(transactionContext).pop();
                    }
                  },
                  builder: (transactionContext, state) {
                    return Column(
                      children: [
                        if (state.uiState == TransactionUIState.SUCCESS)
                          KwTable(
                            placeholder: 'assets/recipient.jpg',
                            status: state.transaction!.status,
                            recipientName: state.transaction!.recipientName,
                            transactionDate:
                                '${state.transaction?.transactionDate} days ago',
                            transactionNumber: state.transaction!.id,
                            amount: 1000000,
                          ),
                        if (state.uiState == TransactionUIState.FAILED)
                          SizedBox(height: 15,),
                          Center(
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: size12,
                                    right: size12,
                                    top: size15,
                                    bottom: size10),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(size7),
                                    )),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/warning.png",
                                      width: size90,
                                    ),
                                    SizedBox(height: size10,),
                                    Text('${state.message}', style: TextStyle(fontSize: size15),textAlign: TextAlign.center,),
                                    SizedBox(height: size30,),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          BlocProvider.of<TransactionBloc>(
                                                  transactionContext)
                                              .add(GetTransactionsEvent(
                                                  userId: user?.id));
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (transactionContext) =>
                                                      WelcomeView(user: user)));
                                        },
                                        style: elevatedMinButtonStyle,
                                        child: const Text(
                                          "Retry",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: size10,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
