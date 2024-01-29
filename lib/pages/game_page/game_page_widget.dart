import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_page_model.dart';
export 'game_page_model.dart';

class GamePageWidget extends StatefulWidget {
  const GamePageWidget({
    super.key,
    this.gameRef,
  });

  final DocumentReference? gameRef;

  @override
  State<GamePageWidget> createState() => _GamePageWidgetState();
}

class _GamePageWidgetState extends State<GamePageWidget>
    with TickerProviderStateMixin {
  late GamePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: StreamBuilder<GamesRecord>(
        stream: GamesRecord.getDocument(widget.gameRef!),
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
          final containerGamesRecord = snapshot.data!;
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/preview.png',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: StreamBuilder<List<GameScoresRecord>>(
                    stream: queryGameScoresRecord(
                      queryBuilder: (gameScoresRecord) => gameScoresRecord
                          .where(
                            'game',
                            isEqualTo: widget.gameRef,
                          )
                          .where(
                            'user',
                            isEqualTo: containerGamesRecord.answeringUser,
                          ),
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00212836),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 54.0, 24.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: RichText(
                                                textScaleFactor:
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Ok ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          currentUserDisplayName,
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: ' Lets Answer Now!',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (currentUserReference !=
                                          containerGamesRecord.answeringUser)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 500.0,
                                              height: 300.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00151820),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      'How old is our planet?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFF5E007E),
                                                                fontSize: 25.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/1155916463.png',
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await widget.gameRef!
                                                          .update({
                                                        ...createGamesRecordData(
                                                          selectMode: true,
                                                          scoreMode: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'answering_user':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await scoreModeGameScoresRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'score': FieldValue
                                                                .increment(
                                                                    -(1)),
                                                          },
                                                        ),
                                                      });
                                                      if (animationsMap[
                                                              'buttonOnActionTriggerAnimation1'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'buttonOnActionTriggerAnimation1']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                    },
                                                    text: '10 years old',
                                                    options: FFButtonOptions(
                                                      width: 400.0,
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF2E0038),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 4.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'buttonOnActionTriggerAnimation1']!,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await widget.gameRef!
                                                          .update({
                                                        ...createGamesRecordData(
                                                          selectMode: true,
                                                          scoreMode: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'answering_user':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await scoreModeGameScoresRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'score': FieldValue
                                                                .increment(
                                                                    -(1)),
                                                          },
                                                        ),
                                                      });
                                                      if (animationsMap[
                                                              'buttonOnActionTriggerAnimation2'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'buttonOnActionTriggerAnimation2']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                    },
                                                    text:
                                                        '4.942 billion years old',
                                                    options: FFButtonOptions(
                                                      width: 400.0,
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF2E0038),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 4.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'buttonOnActionTriggerAnimation2']!,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await widget.gameRef!
                                                          .update({
                                                        ...createGamesRecordData(
                                                          selectMode: true,
                                                          scoreMode: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'answering_user':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await scoreModeGameScoresRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'score': FieldValue
                                                                .increment(
                                                                    -(1)),
                                                          },
                                                        ),
                                                      });
                                                      if (animationsMap[
                                                              'buttonOnActionTriggerAnimation3'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'buttonOnActionTriggerAnimation3']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                    },
                                                    text:
                                                        '100million years old',
                                                    options: FFButtonOptions(
                                                      width: 400.0,
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF2E0038),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 4.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'buttonOnActionTriggerAnimation3']!,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await scoreModeGameScoresRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'score': FieldValue
                                                                .increment(
                                                                    -(1)),
                                                          },
                                                        ),
                                                      });

                                                      await scoreModeGameScoresRecord!
                                                          .reference
                                                          .update(
                                                              createGameScoresRecordData(
                                                        score: functions
                                                            .calculateNewScore(
                                                                scoreModeGameScoresRecord!
                                                                    .score,
                                                                containerGamesRecord
                                                                    .currentValue,
                                                                true),
                                                      ));
                                                    },
                                                    text:
                                                        '4.543 billion years old',
                                                    options: FFButtonOptions(
                                                      width: 400.0,
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF2E0038),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 4.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              scoreModeGameScoresRecord?.score?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
