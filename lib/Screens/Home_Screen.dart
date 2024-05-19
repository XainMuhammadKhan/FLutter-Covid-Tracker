import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:covid_app/Models/Countries.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Countries? _countryData;
  bool _isLoading = false;
  bool _hasError = false;

  Future<void> _fetchData(String country) async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final response = await http.get(
        Uri.parse(
            'https://covid-193.p.rapidapi.com/statistics?country=$country'),
        headers: {
          'x-rapidapi-host': 'covid-193.p.rapidapi.com',
          'x-rapidapi-key': '3deba77161msh481b5ddedb72124p119366jsn0ff107d43d77'
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          _countryData = Countries.fromJson(json.decode(response.body));
          _isLoading = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 240, 248),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              "assets/covid-header-2.png",
              fit: BoxFit.fill,
              height: 260,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: const Color.fromARGB(255, 0, 225, 255))),
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search Country',
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search, color: Colors.black54),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _fetchData(
                          _controller.text.trim()); // Remove extra spaces
                    }
                  },
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 16),
          _isLoading
              ? CircularProgressIndicator()
              : _hasError
                  ? Text('Error fetching data. Please try again.')
                  : _countryData == null
                      ? Text('Enter a country to see statistics.')
                      : _countryData!.response!.isEmpty
                          ? Text(
                              'No data available for the selected parameters.')
                          : Expanded(
                              child: ListView.builder(
                                itemCount: _countryData!.response!.length,
                                itemBuilder: (context, index) {
                                  final response =
                                      _countryData!.response![index];
                                  return Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 16),
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            height: 100,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    width: 3,
                                                    color: Colors.black),
                                                color: Color.fromARGB(
                                                    255, 211, 210, 210)),
                                            child: Text(
                                              response.country ??
                                                  'Unknown Country',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    width: 3,
                                                    color: const Color.fromARGB(
                                                        255, 0, 250, 8)),
                                                color: Color.fromARGB(
                                                    255, 118, 247, 122)),
                                            child: Text(
                                              "Cases:\n${response.cases?.total ?? 0}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 119, 5),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    width: 3,
                                                    color: const Color.fromARGB(
                                                        255, 255, 17, 0)),
                                                color: const Color.fromARGB(
                                                    255, 250, 109, 99)),
                                            child: Text(
                                                "Active Cases:\n${response.cases?.active ?? 0}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 145, 10, 0),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    width: 3,
                                                    color: Color.fromARGB(
                                                        255, 0, 102, 185)),
                                                color: const Color.fromARGB(
                                                    255, 109, 186, 248)),
                                            child: Text(
                                                "Recovered:\n${response.cases?.recovered ?? 0}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 73, 133),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    width: 3,
                                                    color: const Color.fromARGB(
                                                        255, 133, 35, 0)),
                                                color: const Color.fromARGB(
                                                    255, 117, 89, 79)),
                                            child: Text(
                                                "Deaths:\n${response.deaths?.total ?? 0}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 173, 47, 1),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    width: 3,
                                                    color: const Color.fromARGB(
                                                        255, 255, 230, 0)),
                                                color: const Color.fromARGB(
                                                    255, 255, 241, 116)),
                                            child: Text(
                                                "Tests:\n${response.tests?.s1MPop ?? 0}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 155, 139, 0),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
        ],
      ),
    );
  }
}
