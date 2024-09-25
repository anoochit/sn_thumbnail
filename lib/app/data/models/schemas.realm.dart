// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ImageGen extends _ImageGen
    with RealmEntity, RealmObjectBase, RealmObject {
  ImageGen(
    ObjectId id,
    String prompt,
    String template,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'prompt', prompt);
    RealmObjectBase.set(this, 'template', template);
  }

  ImageGen._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get prompt => RealmObjectBase.get<String>(this, 'prompt') as String;
  @override
  set prompt(String value) => RealmObjectBase.set(this, 'prompt', value);

  @override
  String get template =>
      RealmObjectBase.get<String>(this, 'template') as String;
  @override
  set template(String value) => RealmObjectBase.set(this, 'template', value);

  @override
  Stream<RealmObjectChanges<ImageGen>> get changes =>
      RealmObjectBase.getChanges<ImageGen>(this);

  @override
  Stream<RealmObjectChanges<ImageGen>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ImageGen>(this, keyPaths);

  @override
  ImageGen freeze() => RealmObjectBase.freezeObject<ImageGen>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'prompt': prompt.toEJson(),
      'template': template.toEJson(),
    };
  }

  static EJsonValue _toEJson(ImageGen value) => value.toEJson();
  static ImageGen _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'prompt': EJsonValue prompt,
        'template': EJsonValue template,
      } =>
        ImageGen(
          fromEJson(id),
          fromEJson(prompt),
          fromEJson(template),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ImageGen._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, ImageGen, 'ImageGen', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('prompt', RealmPropertyType.string),
      SchemaProperty('template', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class TextGen extends _TextGen with RealmEntity, RealmObjectBase, RealmObject {
  TextGen(
    ObjectId id,
    String prompt, {
    Iterable<String> contents = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'prompt', prompt);
    RealmObjectBase.set<RealmList<String>>(
        this, 'contents', RealmList<String>(contents));
  }

  TextGen._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get prompt => RealmObjectBase.get<String>(this, 'prompt') as String;
  @override
  set prompt(String value) => RealmObjectBase.set(this, 'prompt', value);

  @override
  RealmList<String> get contents =>
      RealmObjectBase.get<String>(this, 'contents') as RealmList<String>;
  @override
  set contents(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<TextGen>> get changes =>
      RealmObjectBase.getChanges<TextGen>(this);

  @override
  Stream<RealmObjectChanges<TextGen>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TextGen>(this, keyPaths);

  @override
  TextGen freeze() => RealmObjectBase.freezeObject<TextGen>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'prompt': prompt.toEJson(),
      'contents': contents.toEJson(),
    };
  }

  static EJsonValue _toEJson(TextGen value) => value.toEJson();
  static TextGen _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'prompt': EJsonValue prompt,
      } =>
        TextGen(
          fromEJson(id),
          fromEJson(prompt),
          contents: fromEJson(ejson['contents']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TextGen._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, TextGen, 'TextGen', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('prompt', RealmPropertyType.string),
      SchemaProperty('contents', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Preference extends _Preference
    with RealmEntity, RealmObjectBase, RealmObject {
  Preference(
    ObjectId id,
    String geminiAPIKey,
    String stabilityAPIKey,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'geminiAPIKey', geminiAPIKey);
    RealmObjectBase.set(this, 'stabilityAPIKey', stabilityAPIKey);
  }

  Preference._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get geminiAPIKey =>
      RealmObjectBase.get<String>(this, 'geminiAPIKey') as String;
  @override
  set geminiAPIKey(String value) =>
      RealmObjectBase.set(this, 'geminiAPIKey', value);

  @override
  String get stabilityAPIKey =>
      RealmObjectBase.get<String>(this, 'stabilityAPIKey') as String;
  @override
  set stabilityAPIKey(String value) =>
      RealmObjectBase.set(this, 'stabilityAPIKey', value);

  @override
  Stream<RealmObjectChanges<Preference>> get changes =>
      RealmObjectBase.getChanges<Preference>(this);

  @override
  Stream<RealmObjectChanges<Preference>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Preference>(this, keyPaths);

  @override
  Preference freeze() => RealmObjectBase.freezeObject<Preference>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'geminiAPIKey': geminiAPIKey.toEJson(),
      'stabilityAPIKey': stabilityAPIKey.toEJson(),
    };
  }

  static EJsonValue _toEJson(Preference value) => value.toEJson();
  static Preference _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'geminiAPIKey': EJsonValue geminiAPIKey,
        'stabilityAPIKey': EJsonValue stabilityAPIKey,
      } =>
        Preference(
          fromEJson(id),
          fromEJson(geminiAPIKey),
          fromEJson(stabilityAPIKey),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Preference._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, Preference, 'Preference', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('geminiAPIKey', RealmPropertyType.string),
      SchemaProperty('stabilityAPIKey', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Project extends _Project with RealmEntity, RealmObjectBase, RealmObject {
  Project(
    ObjectId id,
    String title,
    String type,
    int contentId,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'contentId', contentId);
  }

  Project._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  int get contentId => RealmObjectBase.get<int>(this, 'contentId') as int;
  @override
  set contentId(int value) => RealmObjectBase.set(this, 'contentId', value);

  @override
  Stream<RealmObjectChanges<Project>> get changes =>
      RealmObjectBase.getChanges<Project>(this);

  @override
  Stream<RealmObjectChanges<Project>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Project>(this, keyPaths);

  @override
  Project freeze() => RealmObjectBase.freezeObject<Project>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'type': type.toEJson(),
      'contentId': contentId.toEJson(),
    };
  }

  static EJsonValue _toEJson(Project value) => value.toEJson();
  static Project _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'type': EJsonValue type,
        'contentId': EJsonValue contentId,
      } =>
        Project(
          fromEJson(id),
          fromEJson(title),
          fromEJson(type),
          fromEJson(contentId),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Project._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Project, 'Project', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('contentId', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
