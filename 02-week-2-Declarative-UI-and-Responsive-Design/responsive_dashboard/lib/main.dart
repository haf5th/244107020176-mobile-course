import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DashboardApp());

class DashboardApp extends StatefulWidget {
  const DashboardApp({super.key});

  @override
  State createState() => _DashboardAppState();
}

class _DashboardAppState extends State {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academic Overview',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: AcademicOverviewPage(
        isDark: isDark,
        onDarkChanged: (value) => setState(() => isDark = value),
      ),
    );
  }
}

class AcademicOverviewPage extends StatelessWidget {
  final bool isDark;
  final ValueChanged onDarkChanged;

  const AcademicOverviewPage({
    required this.isDark,
    required this.onDarkChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Overview'),
        actions: [
          Semantics(
            label: 'Sakelar Tema',
            hint: 'Mengubah tema antara mode terang dan gelap',
            toggled: isDark,
            child: Row(
              children: [
                Icon(
                  isDark ? Icons.dark_mode : Icons.light_mode,
                  semanticLabel: isDark ? 'Mode Gelap' : 'Mode Terang',
                ),
                const SizedBox(width: 6),
                Switch.adaptive(
                  value: isDark,
                  onChanged: onDarkChanged,
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Profil Mahasiswa
              const ProfileHeaderCard(),
              const SizedBox(height: 20),

              // Layout Responsif (1 Kolom Sempit / 2 Kolom Lebar)
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 700;
                  final columns = isWide ? 2 : 1;

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: isWide ? 2.8 : 2.5,
                    children: const [
                      AcademicCard(
                        title: 'Assignments',
                        value: '8 Pending',
                        icon: Icons.assignment_outlined,
                        accentColor: Colors.orange,
                        semanticLabel: 'Tugas: 8 pending',
                      ),
                      AcademicCard(
                        title: 'Attendance',
                        value: '92%',
                        icon: Icons.check_circle_outline,
                        accentColor: Colors.green,
                        semanticLabel: 'Kehadiran: 92 persen',
                      ),
                      AcademicCard(
                        title: 'Cumulative GPA',
                        value: '3.85',
                        icon: Icons.school_outlined,
                        accentColor: Colors.indigo,
                        semanticLabel: 'IPK Kumulatif: 3.85',
                      ),
                      AcademicCard(
                        title: 'Current Week',
                        value: 'Week 02',
                        icon: Icons.calendar_today_outlined,
                        accentColor: Colors.purple,
                        semanticLabel: 'Minggu Akademik: Minggu ke 2',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: 'Informasi Profil Mahasiswa',
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: colorScheme.primary,
              child: Text(
                'HN',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hafif Nurrahmad',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'NIM: 244107020176',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer.withOpacity(0.85),
                        ),
                  ),
                  Text(
                    'Teknik Informatika — Pemrograman Mobile',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onPrimaryContainer.withOpacity(0.75),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AcademicCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color accentColor;
  final String semanticLabel;

  const AcademicCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.accentColor,
    required this.semanticLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: semanticLabel,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outlineVariant.withOpacity(0.4),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: accentColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}