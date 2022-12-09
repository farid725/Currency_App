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

  MainView? _mainView;
  Future<ApiResponse>? rate;

  @override
  void initState() {
    super.initState();
    _mainView = Provider.of<MainView>(context, listen: false);
    rate = _mainView?.fetch();
  }

  List <String> images = [
    'images/AED.png',
    'images/AUD.png',
    'images/CAD.png',
    'images/CHF.png',
    'images/CNY.png',
    'images/DKK.png',
    'images/EGP.png',
    'images/EUR.png',
    'images/GBP.png',
    'images/ISK.png',
    'images/JPY.png',
    'images/KRW.png',
    'images/KWD.png',
    'images/KZT.png',
    'images/LBP.png',
    'images/MYR.png',
    'images/NOK.png',
    'images/PLN.png',
    'images/RUB.png',
    'images/SEK.png',
    'images/SGD.png',
    'images/TRY.png',
    'images/UAH.png',
    'images/USD.png',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Dollar Rate"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh)),
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
                              height: 140,
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
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            snapshot.data?.data[index].title
                                                .toString()
                                                .length ==
                                                0
                                                ? "---"
                                                : snapshot
                                                .data?.data[index].title ??
                                                "---",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.teal),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Image(
                                                image: AssetImage(
                                                    images[index]
                                                ),
                                                height: 15,
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Text(
                                              snapshot.data?.data[index].code
                                                  .toString()
                                                  .length ==
                                                  0
                                                  ? "---"
                                                  : snapshot
                                                  .data?.data[index].code ??
                                                  "---",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.teal),
                                            ),
                                          ],
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
                                                snapshot.data?.data[index]
                                                    .cbPrice
                                                    .toString()
                                                    .length ==
                                                    0
                                                    ? "---"
                                                    : snapshot.data?.data[index]
                                                    .cbPrice ??
                                                    "---",
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
                                                  snapshot.data?.data[index]
                                                      .nbuBuyPrice
                                                      .toString()
                                                      .length ==
                                                      0
                                                      ? "---"
                                                      : snapshot
                                                      .data
                                                      ?.data[index]
                                                      .nbuBuyPrice ??
                                                      "---",
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
                                                  snapshot.data?.data[index]
                                                      .nbuCellPrice
                                                      .toString()
                                                      .length ==
                                                      0
                                                      ? "---"
                                                      : snapshot
                                                      .data
                                                      ?.data[index]
                                                      .nbuCellPrice ??
                                                      "---",
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
                                    ),
                                        Padding(
                                      padding: EdgeInsets.only(left: 20,top: 20),
                                      child: Text(
                                        snapshot.data?.data[index]
                                            .date
                                            .toString()
                                            .length ==
                                            0
                                            ? "---"
                                            : snapshot.data?.data[index]
                                            .date ??
                                            "---",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.deepPurple
                                        ),
                                      ),
                                    ),
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
