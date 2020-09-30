import 'package:Food_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static const routeName = '/SettingsScreen';
  final Function setsettings;
  final Map<String, bool> currentsettings;
  Settings(this.currentsettings, this.setsettings);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var _glutenfree = false;

  var _lactosefree = false;

  var _vegetarian = false;

  var _vegan = false;
  @override
  initState() {
    _glutenfree = widget.currentsettings['gluten'];
    _lactosefree = widget.currentsettings['lactose'];
    _vegetarian = widget.currentsettings['vegetarian'];
    _vegan = widget.currentsettings['vegan'];
    super.initState();
  }

  Widget _buildswitch(
      String text, String subtext, bool newValue, Function updated) {
    return SwitchListTile(
      onChanged: updated,
      title: Text(text),
      subtitle: Text(subtext),
      value: newValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final settings = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegetarian,
                  'vegetarian': _vegan
                };
                widget.setsettings(settings);
              }),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Select your meals',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                _buildswitch('is-Glutenfree',
                    'Only includes gluten free meals ', _glutenfree, (x) {
                  setState(() {
                    _glutenfree = x; // x is new Valur
                  });
                }),
                _buildswitch('is-LactoseFree',
                    'Only includes Lactose free meals ', _lactosefree, (x) {
                  setState(() {
                    _lactosefree = x;
                  });
                }),
                _buildswitch('is-Vegetarian', 'Only includes vegetarin meals ',
                    _vegetarian, (x) {
                  setState(() {
                    _vegetarian = x;
                  });
                }),
                _buildswitch('is-Vegan', 'Only include Vegan meals ', _vegan,
                    (x) {
                  setState(() {
                    _vegan = x;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
