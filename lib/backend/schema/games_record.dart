import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "categories" field.
  List<int>? _categories;
  List<int> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "select_mode" field.
  bool? _selectMode;
  bool get selectMode => _selectMode ?? false;
  bool hasSelectMode() => _selectMode != null;

  // "question_mode" field.
  bool? _questionMode;
  bool get questionMode => _questionMode ?? false;
  bool hasQuestionMode() => _questionMode != null;

  // "score_mode" field.
  bool? _scoreMode;
  bool get scoreMode => _scoreMode ?? false;
  bool hasScoreMode() => _scoreMode != null;

  // "current_category" field.
  int? _currentCategory;
  int get currentCategory => _currentCategory ?? 0;
  bool hasCurrentCategory() => _currentCategory != null;

  // "current_value" field.
  int? _currentValue;
  int get currentValue => _currentValue ?? 0;
  bool hasCurrentValue() => _currentValue != null;

  // "selecting_user" field.
  DocumentReference? _selectingUser;
  DocumentReference? get selectingUser => _selectingUser;
  bool hasSelectingUser() => _selectingUser != null;

  // "answering_user" field.
  DocumentReference? _answeringUser;
  DocumentReference? get answeringUser => _answeringUser;
  bool hasAnsweringUser() => _answeringUser != null;

  // "current_category_name" field.
  String? _currentCategoryName;
  String get currentCategoryName => _currentCategoryName ?? '';
  bool hasCurrentCategoryName() => _currentCategoryName != null;

  // "current_question" field.
  String? _currentQuestion;
  String get currentQuestion => _currentQuestion ?? '';
  bool hasCurrentQuestion() => _currentQuestion != null;

  // "current_answer" field.
  String? _currentAnswer;
  String get currentAnswer => _currentAnswer ?? '';
  bool hasCurrentAnswer() => _currentAnswer != null;

  // "answered_questions" field.
  List<int>? _answeredQuestions;
  List<int> get answeredQuestions => _answeredQuestions ?? const [];
  bool hasAnsweredQuestions() => _answeredQuestions != null;

  void _initializeFields() {
    _code = castToType<int>(snapshotData['code']);
    _categories = getDataList(snapshotData['categories']);
    _users = getDataList(snapshotData['users']);
    _selectMode = snapshotData['select_mode'] as bool?;
    _questionMode = snapshotData['question_mode'] as bool?;
    _scoreMode = snapshotData['score_mode'] as bool?;
    _currentCategory = castToType<int>(snapshotData['current_category']);
    _currentValue = castToType<int>(snapshotData['current_value']);
    _selectingUser = snapshotData['selecting_user'] as DocumentReference?;
    _answeringUser = snapshotData['answering_user'] as DocumentReference?;
    _currentCategoryName = snapshotData['current_category_name'] as String?;
    _currentQuestion = snapshotData['current_question'] as String?;
    _currentAnswer = snapshotData['current_answer'] as String?;
    _answeredQuestions = getDataList(snapshotData['answered_questions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamesRecord.fromSnapshot(s));

  static Future<GamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamesRecord.fromSnapshot(s));

  static GamesRecord fromSnapshot(DocumentSnapshot snapshot) => GamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamesRecordData({
  int? code,
  bool? selectMode,
  bool? questionMode,
  bool? scoreMode,
  int? currentCategory,
  int? currentValue,
  DocumentReference? selectingUser,
  DocumentReference? answeringUser,
  String? currentCategoryName,
  String? currentQuestion,
  String? currentAnswer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'select_mode': selectMode,
      'question_mode': questionMode,
      'score_mode': scoreMode,
      'current_category': currentCategory,
      'current_value': currentValue,
      'selecting_user': selectingUser,
      'answering_user': answeringUser,
      'current_category_name': currentCategoryName,
      'current_question': currentQuestion,
      'current_answer': currentAnswer,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamesRecordDocumentEquality implements Equality<GamesRecord> {
  const GamesRecordDocumentEquality();

  @override
  bool equals(GamesRecord? e1, GamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.code == e2?.code &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.selectMode == e2?.selectMode &&
        e1?.questionMode == e2?.questionMode &&
        e1?.scoreMode == e2?.scoreMode &&
        e1?.currentCategory == e2?.currentCategory &&
        e1?.currentValue == e2?.currentValue &&
        e1?.selectingUser == e2?.selectingUser &&
        e1?.answeringUser == e2?.answeringUser &&
        e1?.currentCategoryName == e2?.currentCategoryName &&
        e1?.currentQuestion == e2?.currentQuestion &&
        e1?.currentAnswer == e2?.currentAnswer &&
        listEquality.equals(e1?.answeredQuestions, e2?.answeredQuestions);
  }

  @override
  int hash(GamesRecord? e) => const ListEquality().hash([
        e?.code,
        e?.categories,
        e?.users,
        e?.selectMode,
        e?.questionMode,
        e?.scoreMode,
        e?.currentCategory,
        e?.currentValue,
        e?.selectingUser,
        e?.answeringUser,
        e?.currentCategoryName,
        e?.currentQuestion,
        e?.currentAnswer,
        e?.answeredQuestions
      ]);

  @override
  bool isValidKey(Object? o) => o is GamesRecord;
}
