// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPreferenceCollection on Isar {
  IsarCollection<Preference> get preferences => this.collection();
}

const PreferenceSchema = CollectionSchema(
  name: r'Preference',
  id: -2412535530476531349,
  properties: {
    r'geminiAPIKey': PropertySchema(
      id: 0,
      name: r'geminiAPIKey',
      type: IsarType.string,
    ),
    r'stabilityAPIKey': PropertySchema(
      id: 1,
      name: r'stabilityAPIKey',
      type: IsarType.string,
    )
  },
  estimateSize: _preferenceEstimateSize,
  serialize: _preferenceSerialize,
  deserialize: _preferenceDeserialize,
  deserializeProp: _preferenceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _preferenceGetId,
  getLinks: _preferenceGetLinks,
  attach: _preferenceAttach,
  version: '3.1.0+1',
);

int _preferenceEstimateSize(
  Preference object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.geminiAPIKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stabilityAPIKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _preferenceSerialize(
  Preference object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.geminiAPIKey);
  writer.writeString(offsets[1], object.stabilityAPIKey);
}

Preference _preferenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Preference();
  object.geminiAPIKey = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.stabilityAPIKey = reader.readStringOrNull(offsets[1]);
  return object;
}

P _preferenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _preferenceGetId(Preference object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _preferenceGetLinks(Preference object) {
  return [];
}

void _preferenceAttach(IsarCollection<dynamic> col, Id id, Preference object) {
  object.id = id;
}

extension PreferenceQueryWhereSort
    on QueryBuilder<Preference, Preference, QWhere> {
  QueryBuilder<Preference, Preference, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PreferenceQueryWhere
    on QueryBuilder<Preference, Preference, QWhereClause> {
  QueryBuilder<Preference, Preference, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Preference, Preference, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Preference, Preference, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Preference, Preference, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PreferenceQueryFilter
    on QueryBuilder<Preference, Preference, QFilterCondition> {
  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geminiAPIKey',
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geminiAPIKey',
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geminiAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geminiAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geminiAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geminiAPIKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geminiAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geminiAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geminiAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geminiAPIKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geminiAPIKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      geminiAPIKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geminiAPIKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stabilityAPIKey',
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stabilityAPIKey',
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stabilityAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stabilityAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stabilityAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stabilityAPIKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stabilityAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stabilityAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stabilityAPIKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stabilityAPIKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stabilityAPIKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Preference, Preference, QAfterFilterCondition>
      stabilityAPIKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stabilityAPIKey',
        value: '',
      ));
    });
  }
}

extension PreferenceQueryObject
    on QueryBuilder<Preference, Preference, QFilterCondition> {}

extension PreferenceQueryLinks
    on QueryBuilder<Preference, Preference, QFilterCondition> {}

extension PreferenceQuerySortBy
    on QueryBuilder<Preference, Preference, QSortBy> {
  QueryBuilder<Preference, Preference, QAfterSortBy> sortByGeminiAPIKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geminiAPIKey', Sort.asc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy> sortByGeminiAPIKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geminiAPIKey', Sort.desc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy> sortByStabilityAPIKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stabilityAPIKey', Sort.asc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy>
      sortByStabilityAPIKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stabilityAPIKey', Sort.desc);
    });
  }
}

extension PreferenceQuerySortThenBy
    on QueryBuilder<Preference, Preference, QSortThenBy> {
  QueryBuilder<Preference, Preference, QAfterSortBy> thenByGeminiAPIKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geminiAPIKey', Sort.asc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy> thenByGeminiAPIKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geminiAPIKey', Sort.desc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy> thenByStabilityAPIKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stabilityAPIKey', Sort.asc);
    });
  }

  QueryBuilder<Preference, Preference, QAfterSortBy>
      thenByStabilityAPIKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stabilityAPIKey', Sort.desc);
    });
  }
}

extension PreferenceQueryWhereDistinct
    on QueryBuilder<Preference, Preference, QDistinct> {
  QueryBuilder<Preference, Preference, QDistinct> distinctByGeminiAPIKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geminiAPIKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preference, Preference, QDistinct> distinctByStabilityAPIKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stabilityAPIKey',
          caseSensitive: caseSensitive);
    });
  }
}

extension PreferenceQueryProperty
    on QueryBuilder<Preference, Preference, QQueryProperty> {
  QueryBuilder<Preference, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Preference, String?, QQueryOperations> geminiAPIKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geminiAPIKey');
    });
  }

  QueryBuilder<Preference, String?, QQueryOperations>
      stabilityAPIKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stabilityAPIKey');
    });
  }
}
