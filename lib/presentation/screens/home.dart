import 'package:dealsdray_testapp/infrastructure/sources/exclusive_data.dart';
import 'package:dealsdray_testapp/presentation/widgets/banner.dart';
import 'package:dealsdray_testapp/presentation/widgets/categories_row.dart';
import 'package:dealsdray_testapp/presentation/widgets/exclusive_row.dart';
import 'package:dealsdray_testapp/presentation/widgets/pending_kyc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('data'),
          automaticallyImplyLeading: false,
          elevation: 6,
          backgroundColor: Colors.white,
          // surfaceTintColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () => _scaffoldKey.currentState!.openDrawer,
                  icon: const Icon(Icons.menu)),
            ),
            Expanded(
              child: SizedBox(
                height: 42,
                child: TextField(
                  // controller: _searchController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    hintText: 'Search here',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: 0),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                    suffixIcon: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined)),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.amber,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: banner(),
            ),
            const SliverToBoxAdapter(
              child: PendingKYC(),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            const SliverToBoxAdapter(
              child: CategoriesRow(),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            SliverToBoxAdapter(
              child: Container(
                // height: 400,
                width: MediaQuery.of(context).size.width,
                // margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                decoration: const BoxDecoration(
                    // color: ,
                    gradient: LinearGradient(
                        transform: GradientRotation(90),
                        colors: [
                      Color.fromRGBO(101, 178, 207, 1),
                      Color.fromRGBO(132, 222, 255, 1)
                    ])),
                child: Stack(
                  children: [
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      // right: -10,
                      top: 50,
                      left: 200,
                      child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.45),
                            shape: BoxShape.circle,
                          )),
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      // right: -10,
                      top: -20,
                      left: 180,
                      child: Container(
                          height: 400,
                          // width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.45),
                            shape: BoxShape.circle,
                          )),
                    ),
                    Container(
                      // color: Colors.green,
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  'EXCLUSIVE FOR YOU',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          // SizedBox(height: 16,),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: exclusiveData.length,
                              itemBuilder: (context, index) {
                                return exclusiveItem(exclusiveData[index]);
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
