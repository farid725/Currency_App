import 'package:currency_app/main_view_model/api_response.dart';
import 'package:currency_app/main_view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> myList = [
    'EUR',
    'USD',
    'RUB',
    'EUR',
    'USD',
    'RUB',
  ];

  MainView? _mainView;
  Future<ApiResponse>? rate;

  @override
  void initState() {
    super.initState();
    _mainView = Provider.of<MainView>(context, listen: false);
    rate = _mainView?.fetch();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dollar Rate"),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.account_balance_rounded))
        ],
      ),
      body: Container(
          height: size.height,
          child: FutureBuilder(
              future: rate,
              builder: (context, snapshot) {
                if (snapshot.data?.status == Status.SUCCES) {
                  return Padding(
                    padding: EdgeInsets.zero,
                    child: ListView.builder(
                      itemCount: snapshot.data?.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                            ),
                            child: Container(
                              width: size.width * 1.0,
                              height: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black12,
                                    width: 5.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        snapshot.data?.data[index].nbuCellPrice
                                            .toString()
                                            .length ==
                                            0
                                            ? "---"
                                            : snapshot.data?.data[index]
                                            .nbuCellPrice ??
                                            "---",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, right: 20, top: 7),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'MB kursi',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                '10772.44',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 50),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sotib olish',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  '11200.00',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 50),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sotish',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  '11400.00',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.data?.status == Status.ERROR) {
                  return Text("Error ...");
                } else if (snapshot.data?.status == Status.INITIAL) {
                  return Text("INItial ...");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
