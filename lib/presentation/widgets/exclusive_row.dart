import 'package:flutter/material.dart';

SizedBox exclusiveItem(data) {
    return  SizedBox(
                                width: 180,
                                child: Card(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Stack(
                                          children: [
                                            Image(
                                              image: NetworkImage(
                                                  data["imageUrl"],
                                                  scale: 2),
                                            ),
                                            Positioned(
                                                right: 0,
                                                top: 0,
                                                
                                                // width:180,
                                                child: Text(
                                                  '${data["discount"]}% off',
                                                  style: const TextStyle(
                                                    backgroundColor:
                                                        Colors.green,
                                                    color: Colors.white,
                                                  ),
                                                ))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${data["price"]} Rs.',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start),
                                            Text(
                                              '${data["desc"]}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
  }