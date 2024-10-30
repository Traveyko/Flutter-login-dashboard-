import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog tanpa logout
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
                Navigator.of(context).pop(); // Logout dan kembali ke halaman login
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showLogoutDialog(context); // Menampilkan dialog logout
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: User Profile
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Ganti dengan gambar profil pengguna
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Admin!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'admin@example.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Section: Quick Actions
            Text(
              'Quick Actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.analytics, 'Statistics', Colors.blue),
                _buildActionButton(Icons.settings, 'Settings', Colors.orange),
                _buildActionButton(Icons.message, 'Messages', Colors.green),
                _buildActionButton(Icons.notifications, 'Alerts', Colors.red),
              ],
            ),
            SizedBox(height: 24),

            // Section: Statistics
            Text(
              'Statistics Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Users', style: TextStyle(fontSize: 16)),
                        Text('1200', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Active Users', style: TextStyle(fontSize: 16)),
                        Text('980', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New Users', style: TextStyle(fontSize: 16)),
                        Text('50', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Section: Recent Activity
            Text(
              'Recent Activity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3, // Number of recent activities
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.blue),
                    title: Text('User ${index + 1} logged in'),
                    subtitle: Text('Today, 10:${index + 2} AM'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create action buttons
  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, size: 30, color: color),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
