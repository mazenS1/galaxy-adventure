import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'score_page_model.dart';
export 'score_page_model.dart';

class ScorePageWidget extends StatefulWidget {
  const ScorePageWidget({super.key});

  @override
  State<ScorePageWidget> createState() => _ScorePageWidgetState();
}

class _ScorePageWidgetState extends State<ScorePageWidget> {
  late ScorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScorePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Lottie.asset(
                'assets/lottie_animations/Animation_-_1706560713375.json',
                width: 5000.0,
                height: 937.0,
                fit: BoxFit.fitHeight,
                animate: true,
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                    child: StreamBuilder<List<GameScoresRecord>>(
                      stream: queryGameScoresRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<GameScoresRecord> scoreModeGameScoresRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final scoreModeGameScoresRecord =
                            scoreModeGameScoresRecordList.isNotEmpty
                                ? scoreModeGameScoresRecordList.first
                                : null;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'YOU HAVE A TOTAL OF\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      scoreModeGameScoresRecord?.score
                                          ?.toString(),
                                      '0',
                                    ),
                                    style: TextStyle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' POINTS!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25.0,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 0.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'YOU HAVE WON \n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 25.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        scoreModeGameScoresRecord?.levelsWon
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' LEVELS!',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 100.0, 0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'YOU LEARNED ABOUT :   ',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          scoreModeGameScoresRecord
                                              ?.levelWonName,
                                          'none',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '!',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 80.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('HomePage');
                                },
                                text: 'Back ',
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 4.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
