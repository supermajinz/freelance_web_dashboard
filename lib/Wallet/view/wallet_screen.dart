import 'package:dash/Wallet/data/bloc/wallet_bloc.dart';
import 'package:dash/Wallet/data/models/wallet_payments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:dash/Wallet/data/models/transaction_request.dart';
import 'package:dash/Wallet/data/models/transactions.dart';
import 'package:dash/Wallet/data/models/wallet.dart';

class WalletDashboard extends StatefulWidget {
  final int userId;

  const WalletDashboard({Key? key, required this.userId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WalletDashboardState createState() => _WalletDashboardState();
}

class _WalletDashboardState extends State<WalletDashboard> {
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(GetWalletPayments(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Dashboard'),
        centerTitle: true,
      ),
      body: BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state is TransactionCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Transaction completed successfully')),
            );
            context.read<WalletBloc>().add(GetWalletPayments(widget.userId));
          }
        },
        builder: (context, state) {
          if (state is WalletLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WalletPaymentsLoaded) {
            return _buildDashboard(state.walletPayments);
          } else if (state is WalletError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }

  Widget _buildDashboard(WalletPayments walletPayments) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWalletOverview(walletPayments.wallet!),
            const SizedBox(height: 24),
            _buildTransactionButtons(),
            const SizedBox(height: 24),
            _buildTransactionHistory(walletPayments.transactions!),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletOverview(Wallet wallet) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('Wallet Overview',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 16,
                ),
                _buildBalanceItem('Total Balance', wallet.totalBalance ?? 0),
                const SizedBox(width: 16), // Reduced space
                _buildBalanceItem('Held Amount', wallet.totalHeldBalance ?? 0),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceItem(String label, double amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          '${amount.toStringAsFixed(2)} SYP',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTransactionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Deposit'),
          onPressed: () => _showTransactionDialog('Deposit'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          icon: const Icon(Icons.remove),
          label: const Text('Withdraw'),
          onPressed: () => _showTransactionDialog('Withdraw'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
      ],
    );
  }

  void _showTransactionDialog(String type) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$type Funds'),
          content: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
              suffixText: 'SYP',
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () {
                if (_amountController.text.isNotEmpty) {
                  if (type == 'Deposit') {
                    context.read<WalletBloc>().add(DepositToUserWallet(
                        widget.userId,
                        int.parse(_amountController.text),
                        DateTime.now(),
                        "DEPOSIT"));
                  } else {
                    context.read<WalletBloc>().add(WithdrawFromUserWallet(
                          userId: widget.userId,
                          amount: int.parse(_amountController.text),
                          transactionDate: DateTime.now(),
                          type: 'WITHDRAW',
                        ));
                  }
                  Navigator.of(context).pop();
                  _amountController.clear();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTransactionHistory(List<Transaction> transactions) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Transaction History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('No.')),
                  DataColumn(label: Text('Date & Time')),
                  DataColumn(label: Text('Type')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Balance')),
                ],
                rows: transactions.asMap().entries.map((entry) {
                  int index = entry.key;
                  Transaction transaction = entry.value;
                  bool isReceived = transaction.receiverUserId == widget.userId;
                  String status = isReceived ? 'Received' : 'Sent';
                  Color amountColor =
                      transaction.type == 'DEPOSIT' ? Colors.green : Colors.red;
                  String amountPrefix =
                      transaction.type == 'DEPOSIT' ? '+' : '-';

                  return DataRow(cells: [
                    DataCell(Text('${transaction.transactionNumber}')),
                    DataCell(Text(DateFormat('MM/dd/yyyy HH:mm')
                        .format(transaction.transactionDate!))),
                    DataCell(Text(transaction.type ?? '')),
                    DataCell(Text(status)),
                    DataCell(Text(
                      '$amountPrefix${transaction.amount?.toStringAsFixed(2)} SYP',
                      style: TextStyle(
                          color: amountColor, fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                        '${transaction.postBalance?.toStringAsFixed(2)} SYP')),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
