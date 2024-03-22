import 'package:flutter/material.dart';

class SismoScreen extends StatefulWidget {
  const SismoScreen({super.key});

  @override
  _SismoScreenState createState() => _SismoScreenState();
}

class _SismoScreenState extends State<SismoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late bool _is24HoursSelected;
  late bool _is15DaysSelected;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _is24HoursSelected = true;
    _is15DaysSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sismos',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Mapa'),
            Tab(text: 'Lista'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded),
            color: const Color.fromRGBO(255, 152, 0, 1),
            onPressed: () {
              // Acción al presionar el botón de ayuda
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _buildMapPage(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMapPage(),
                    _buildListPage(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100, // Altura deseada de los botones
                child: Center(
                  child: ToggleButtons(
                    isSelected: [_is24HoursSelected, _is15DaysSelected],
                    onPressed: (index) {
                      setState(() {
                        if (index == 0) {
                          _is24HoursSelected = true;
                          _is15DaysSelected = false;
                        } else {
                          _is24HoursSelected = false;
                          _is15DaysSelected = true;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(5.0),
                    selectedColor: Colors.white,
                    //borderColor: const Color.fromRGBO(255, 152, 0, 1),
                    children: [
                      for (var i = 0; i < 2; i++)
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _is24HoursSelected
                                ? (i == 0
                                    ? const Color.fromARGB(255, 255, 152, 0)
                                    : Color.fromARGB(255, 49, 48, 63))
                                : (i == 1
                                    ? const Color.fromARGB(255, 255, 152, 0)
                                    : Color.fromARGB(255, 49, 48, 63)),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 255, 152, 0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(i == 0 ? '24 horas' : '15 días',
                                  style: TextStyle(
                                      color: _is24HoursSelected
                                          ? Colors.white
                                          : Colors.black)),
                              Icon(
                                  i == 0
                                      ? Icons.access_time
                                      : Icons.calendar_today,
                                  color: _is24HoursSelected
                                      ? Colors.white
                                      : Colors.black),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: 'Sismos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: '¿Lo sentistes?',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Más',
          ),
        ],
      ),
    );
  }

  Widget _buildMapPage() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/map.png"), fit: BoxFit.cover)),
    );
  }

  Widget _buildListPage() {
    return Center(
      child: Text(''),
    );
  }
}
