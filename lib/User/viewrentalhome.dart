import 'package:flutter/material.dart';
import 'package:loginrace/User/viewrentsingleimagediscrip.dart';
import 'package:responsive_grid/responsive_grid.dart';



class UserViewRentHome extends StatefulWidget {
  const UserViewRentHome({Key? key}) : super(key: key);

  @override
  State<UserViewRentHome> createState() => _UserViewRentHomeState();
}

class _UserViewRentHomeState extends State<UserViewRentHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Define a list of RentalItem instances
  List<RentalItem> rentalItems = [
    RentalItem(name: 'Race bike Price-4,500/-', description: 'Amazing race bike with incredible features and with face helmet', imagePath: 'images/bikee.jpeg'),
    RentalItem(name: 'Car price-3000/- ', description: '', imagePath: 'images/racing.jpg'),
    RentalItem(name: 'helmet', description: 'full cover face helmet with a cooling inside', imagePath: 'images/bikee.jpeg'),
    // Add more items as needed
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Rental Home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Bikes'),
            Tab(text: 'Cars'),
            Tab(text: 'Grocery'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent('images/bikee.jpeg'),
          _buildTabContent('images/racing.jpg'),
          _buildTabContent('images/bikee.jpeg'),
        ],
      ),
    );
  }

  Widget _buildTabContent(String imagePath) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: rentalItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserViewSingleItem(item: rentalItems[index]),
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    rentalItems[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

