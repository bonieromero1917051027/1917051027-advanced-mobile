import 'package:flutter/material.dart';
import 'package:justduit/models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var data = TransactionModel().getDummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('History'),
          ),
        ),
        body: SafeArea(
            child: Container(
          color: Colors.white10,
          child: FutureBuilder(
              future: Future.delayed(Duration(seconds: 1)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          data = TransactionModel().getDummyData();
                        });
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: data[index].symbol == "+"
                                          ? Color.fromARGB(54, 76, 175, 79)
                                          : Color.fromARGB(54, 244, 67, 54),
                                      child: Icon(
                                        data[index].logo,
                                        color: data[index].symbol == "+"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].TransactionCategory!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          data[index].date!,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      data[index].symbol! +
                                          NumberFormat.simpleCurrency(
                                                  locale: 'id-ID')
                                              .format(data[index].amount),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        )));
  }
}
