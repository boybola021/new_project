


import 'dart:math';

import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final PlaylistsProvider playlistProvider = PlaylistsProvider();
    final List<Playlist> playlists = playlistProvider.playlists;
    final Playlist topSongs = playlistProvider.topSongs;
    final Playlist newReleases = playlistProvider.newReleases;
    final ArtistsProvider artistsProvider = ArtistsProvider();
    final List<Artist> artists = artistsProvider.artists;
    return Scaffold(
      body: SingleChildScrollView(
        child: AdaptiveColumn(
          children: [
            AdaptiveContainer(
              columnSpan: 12,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 10), // Modify this line
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Good morning',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const BrightnessToggle(),
                  ],
                ),
              ),
            ),
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                children: [
                  const HomeHighlight(),
                  LayoutBuilder(
                    builder: (context, constraints) => HomeArtists(
                      artists: artists,
                      constraints: constraints,
                    ),
                  ),
                ],
              ),
            ),
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ), // Modify this line
                    child: Text(
                      'Recently played',
                      style: context.headlineSmall,
                    ),
                  ),
                  HomeRecent(
                    playlists: playlists,
                  ),
                ],
              ),
            ),
            AdaptiveContainer(
              columnSpan: 12,
              child: Padding(
                padding: const EdgeInsets.all(15), // Modify this line
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 8), // Modify this line
                            child: Text(
                              'Top Songs Today',
                              style: context.titleLarge,
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) =>
                                PlaylistSongs(
                                  playlist: topSongs,
                                  constraints: constraints,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    Flexible(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 8), // Modify this line
                            child: Text(
                              'New Releases',
                              style: context.titleLarge,
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) =>
                                PlaylistSongs(
                                  playlist: newReleases,
                                  constraints: constraints,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home), // Modify this line
    route: '/',
  ),
  NavigationDestination(
    label: 'Playlists',
    icon: Icon(Icons.playlist_add_check), // Modify this line
    route: '/playlists',
  ),
  NavigationDestination(
    label: 'Artists',
    icon: Icon(Icons.people), // Modify this line
    route: '/artists',
  ),
];

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}

class ThemeSettingChange extends Notification {
  ThemeSettingChange({required this.settings});
  final ThemeSettings settings;
}

class ThemeProvider extends InheritedWidget {
  const ThemeProvider(
      {Key? key,
        required this.settings,
        required this.lightDynamic,
        required this.darkDynamic,
        required Widget child})
      : super(key: key, child: child);

  final ValueNotifier<ThemeSettings> settings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  final pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  Color custom(CustomColor custom) {
    if (custom.blend) {
      return blend(custom.color);
    } else {
      return custom.color;
    }
  }

  Color blend(Color targetColor) {
    return Color(
        Blend.harmonize(targetColor.value, settings.value.sourceColor.value));
  }

  Color source(Color? target) {
    Color source = settings.value.sourceColor;
    if (target != null) {
      source = blend(target);
    }
    return source;
  }

  ColorScheme colors(Brightness brightness, Color? targetColor) {
    final dynamicPrimary = brightness == Brightness.light
        ? lightDynamic?.primary
        : darkDynamic?.primary;
    return ColorScheme.fromSeed(
      seedColor: dynamicPrimary ?? source(targetColor),
      brightness: brightness,
    );
  }

  ShapeBorder get shapeMedium => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );

  CardTheme cardTheme() {
    return CardTheme(
      elevation: 0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
    );
  }

  ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
    );
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
    );
  }

  TabBarTheme tabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  BottomAppBarTheme bottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarTheme(
      color: colors.surface,
      elevation: 0,
    );
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surfaceVariant,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  NavigationRailThemeData navigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  DrawerThemeData drawerTheme(ColorScheme colors) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
    );
  }

  ThemeData light([Color? targetColor]) {
    final _colors = colors(Brightness.light, targetColor);
    return ThemeData.light().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: _colors,
      appBarTheme: appBarTheme(_colors),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(_colors),
      bottomAppBarTheme: bottomAppBarTheme(_colors),
      bottomNavigationBarTheme: bottomNavigationBarTheme(_colors),
      navigationRailTheme: navigationRailTheme(_colors),
      tabBarTheme: tabBarTheme(_colors),
      drawerTheme: drawerTheme(_colors),
      scaffoldBackgroundColor: _colors.background,
      useMaterial3: true,
    );
  }

  ThemeData dark([Color? targetColor]) {
    final _colors = colors(Brightness.dark, targetColor);
    return ThemeData.dark().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: _colors,
      appBarTheme: appBarTheme(_colors),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(_colors),
      bottomAppBarTheme: bottomAppBarTheme(_colors),
      bottomNavigationBarTheme: bottomNavigationBarTheme(_colors),
      navigationRailTheme: navigationRailTheme(_colors),
      tabBarTheme: tabBarTheme(_colors),
      drawerTheme: drawerTheme(_colors),
      scaffoldBackgroundColor: _colors.background,
      useMaterial3: true,
    );
  }

  ThemeMode themeMode() {
    return settings.value.themeMode;
  }

  ThemeData theme(BuildContext context, [Color? targetColor]) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.light
        ? light(targetColor)
        : dark(targetColor);
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.settings != settings;
  }
}

class ThemeSettings {
  ThemeSettings({
    required this.sourceColor,
    required this.themeMode,
  });

  final Color sourceColor;
  final ThemeMode themeMode;
}

Color randomColor() {
  return Color(Random().nextInt(0xFFFFFFFF));
}

// Custom Colors
const linkColor = CustomColor(
  name: 'Link Color',
  color: Color(0xFF00B0FF),
);

class CustomColor {
  const CustomColor({
    required this.name,
    required this.color,
    this.blend = true,
  });

  final String name;
  final Color color;
  final bool blend;

  Color value(ThemeProvider provider) {
    return provider.custom(this);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ValueNotifier(ThemeSettings(
    sourceColor:  Colors.pink,
    themeMode: ThemeMode.system,
  ));
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlaybackBloc>(
      create: (context) => PlaybackBloc(),
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
            lightDynamic: lightDynamic,
            darkDynamic: darkDynamic,
            settings: settings,
            child: NotificationListener<ThemeSettingChange>(
              onNotification: (notification) {
                settings.value = notification.settings;
                return true;
              },
              child: ValueListenableBuilder<ThemeSettings>(
                valueListenable: settings,
                builder: (context, value, _) {
                  final theme = ThemeProvider.of(context); // Add this line
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: theme.light(settings.value.sourceColor), // Add this line
                    routeInformationParser: appRouter.routeInformationParser,
                    routerDelegate: appRouter.routerDelegate,
                  );
                },
              ),
            )),
      ),
    );
  }
}

final settings = ValueNotifier(ThemeSettings(
  sourceColor:  const Color(0xff00cbe6), // Replace this color
  themeMode: ThemeMode.system,
));


ThemeData light([Color? targetColor]) {
  final _colors = colors(Brightness.light, targetColor);
  return ThemeData.light().copyWith(
    pageTransitionsTheme: pageTransitionsTheme, // Add this line
    colorScheme: ColorScheme.fromSeed(
      seedColor: source(targetColor),
      brightness: Brightness.light,
    ),
    appBarTheme: appBarTheme(_colors),
    cardTheme: cardTheme(),
    listTileTheme: listTileTheme(),
    tabBarTheme: tabBarTheme(_colors),
    scaffoldBackgroundColor: _colors.background,
  );
}

ThemeData dark([Color? targetColor]) {
  final _colors = colors(Brightness.dark, targetColor);
  return ThemeData.dark().copyWith(
    pageTransitionsTheme: pageTransitionsTheme, // Add this line
    colorScheme: ColorScheme.fromSeed(
      seedColor: source(targetColor),
      brightness: Brightness.dark,
    ),
    appBarTheme: appBarTheme(_colors),
    cardTheme: cardTheme(),
    listTileTheme: listTileTheme(),
    tabBarTheme: tabBarTheme(_colors),
    scaffoldBackgroundColor: _colors.background,
  );
}


class OutlinedCard extends StatefulWidget {
  const OutlinedCard({
    Key? key,
    required this.child,
    this.clickable = true,
  }) : super(key: key);
  final Widget child;
  final bool clickable;
  @override
  State<OutlinedCard> createState() => _OutlinedCardState();
}

class _OutlinedCardState extends State<OutlinedCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_hovered ? 20 : 8);
    const animationCurve = Curves.easeInOut;
    return MouseRegion(
      onEnter: (_) {
        if (!widget.clickable) return;
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        if (!widget.clickable) return;
        setState(() {
          _hovered = false;
        });
      },
      cursor: widget.clickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: kThemeAnimationDuration,
        curve: animationCurve,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: borderRadius,
        ),
        foregroundDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(
            _hovered ? 0.12 : 0,
          ),
          borderRadius: borderRadius,
        ),
        child: TweenAnimationBuilder<BorderRadius>(
          duration: kThemeAnimationDuration,
          curve: animationCurve,
          tween: Tween(begin: BorderRadius.zero, end: borderRadius),
          builder: (context, borderRadius, child) => ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: borderRadius,
            child: child,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// #6

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    Key? key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
  }) : super(key: key);

  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: AdaptiveColumn(
              children: [
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Good morning',
                            style: context.displaySmall,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const BrightnessToggle(),
                      ],
                    ),
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Column(
                    children: [
                      const HomeHighlight(),
                      LayoutBuilder(
                        builder: (context, constraints) => HomeArtists(
                          artists: artists,
                          constraints: constraints,
                        ),
                      ),
                    ],
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          'Recently played',
                          style: context.headlineSmall,
                        ),
                      ),
                      HomeRecent(
                        playlists: playlists,
                      ),
                    ],
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 8, bottom: 8),
                                child: Text(
                                  'Top Songs Today',
                                  style: context.titleLarge,
                                ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) =>
                                    PlaylistSongs(
                                      playlist: topSongs,
                                      constraints: constraints,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 25),
                        Flexible(
                          flex: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 8, bottom: 8),
                                child: Text(
                                  'New Releases',
                                  style: context.titleLarge,
                                ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) =>
                                    PlaylistSongs(
                                      playlist: newReleases,
                                      constraints: constraints,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeHighlight extends StatelessWidget {
  const HomeHighlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Padding(
            // Modify this line
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: Clickable(
              child: SizedBox(
                height: 275,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/news/concert.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () => launch('https://docs.flutter.dev'),
            ),
          ),
        ),
      ],
    );
  }
}


const pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
    TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
    TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
  },
);
*/