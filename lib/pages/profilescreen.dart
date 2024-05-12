import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false; // Kullanıcıyı takip edip etmediğinizi takip eden bir değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: SizedBox(
          width: 105,
          height: 28,
          child: Image.asset('model/assets/petpix.png'),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings), // Ayarlar butonu
          color: Colors.black,
        ),
        actions: [
          
          
        ],
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "model/assets/jesse3.jpg",
                  ), // Profil resmi
                ),
                _buildFollowButton(), // Takip etme düğmesi
              ],
            ),
            SizedBox(height: 20),
            Text(
              'JESSE CATMAN', // Kullanıcı adı
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Biyografi",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '72', // Gönderi sayısı
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Gönderiler'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '1234', // Takipçi sayısı
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Takipçiler'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '567', // Takip edilen sayısı
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Takip Edilenler'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Profil düzenleme sayfasına git
              },
              child: Text(
                'Profili Düzenle',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade100),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 6, // Gönderi sayısı
              itemBuilder: (context, index) {
                return Image.asset(
                  'model/assets/jesse1.jpg',
                ); // Gönderi resmi
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isFollowing = !_isFollowing; // Kullanıcının takip durumunu tersine çevir
        });
      },
      child: Text(
        _isFollowing ? 'Takibi Bırak' : 'Takip Et',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: _isFollowing ? Colors.grey : Colors.blue, // Takip durumuna göre düğme rengini ayarla
      ),
    );
  }
}
