import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'quiz4_model.dart';
export 'quiz4_model.dart';

class Quiz4Widget extends StatefulWidget {
  const Quiz4Widget({super.key});

  @override
  State<Quiz4Widget> createState() => _Quiz4WidgetState();
}

class _Quiz4WidgetState extends State<Quiz4Widget>
    with TickerProviderStateMixin {
  late Quiz4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnActionTriggerAnimation1': AnimationInfo(
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
    'imageOnActionTriggerAnimation2': AnimationInfo(
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
    'imageOnActionTriggerAnimation3': AnimationInfo(
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
    'imageOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 20.ms,
          duration: 250.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(2.0, 2.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'imageOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, -73.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Quiz4Model());

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
                                width: MediaQuery.sizeOf(context).width * 1.069,
                                decoration: BoxDecoration(
                                  color: Color(0x00212836),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 54.0, 24.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    scoreModeGameScoresRecord
                                                        ?.score
                                                        ?.toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: ' - is your score\n',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Item_3-1.png.png',
                                              width: 46.0,
                                              height: 21.0,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'imageOnActionTriggerAnimation1']!,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Item_3-1.png.png',
                                              width: 46.0,
                                              height: 21.0,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'imageOnActionTriggerAnimation2']!,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Item_3-1.png.png',
                                              width: 46.0,
                                              height: 21.0,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'imageOnActionTriggerAnimation3']!,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
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
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 500.0,
                                            height: 250.0,
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
                                                    'Earth is the only place that contains life',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/3703673003.gif',
                                                          width: 180.0,
                                                          height: 180.0,
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
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Bomb_03.png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                    cacheWidth: 100,
                                                    cacheHeight: 100,
                                                  ),
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'imageOnActionTriggerAnimation4']!,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Missile_1_Flying_000.png',
                                                  width: 10.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'imageOnActionTriggerAnimation5']!,
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Lottie.asset(
                                              'assets/lottie_animations/Animation_-_1706554681211.json',
                                              width: 74.0,
                                              height: 73.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                          Container(
                                            width: 500.0,
                                            height: 500.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x00151820),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            if (animationsMap[
                                                                    'buttonOnActionTriggerAnimation1'] !=
                                                                null) {
                                                              await animationsMap[
                                                                      'buttonOnActionTriggerAnimation1']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'imageOnActionTriggerAnimation1'] !=
                                                                null) {
                                                              await animationsMap[
                                                                      'imageOnActionTriggerAnimation1']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (scoreModeGameScoresRecord!
                                                                    .score >
                                                                0) {
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
                                                            }
                                                          },
                                                          text: 'FALSE',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 120.0,
                                                            height: 65.0,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            elevation: 4.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'buttonOnActionTriggerAnimation1']!,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      30.0,
                                                                      0.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await scoreModeGameScoresRecord!
                                                                  .reference
                                                                  .update({
                                                                ...createGameScoresRecordData(
                                                                  levelWonName:
                                                                      'Earth',
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'score': FieldValue
                                                                        .increment(
                                                                            1),
                                                                    'levelsWon':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  },
                                                                ),
                                                              });
                                                              if (animationsMap[
                                                                      'imageOnActionTriggerAnimation5'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'imageOnActionTriggerAnimation5']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0);
                                                              }
                                                              if (animationsMap[
                                                                      'imageOnActionTriggerAnimation4'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'imageOnActionTriggerAnimation4']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0);
                                                              }

                                                              context.goNamed(
                                                                'congratsPage',
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .bottomToTop,
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            text: 'TRUE',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 120.0,
                                                              height: 65.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              elevation: 4.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'buttonOnActionTriggerAnimation2']!,
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
          ],
        ),
      ),
    );
  }
}
