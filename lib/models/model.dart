import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const tableMedicament = SqfEntityTable(
    tableName: 'medicaments',
    primaryKeyName: 'id',
    useSoftDeleting: false,
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,

    fields: [
      SqfEntityField('imageSrc', DbType.text),
      SqfEntityField('name', DbType.text),
      SqfEntityField('country', DbType.text, defaultValue: 'Russia'),
      SqfEntityField('price', DbType.text)
    ]);

const seqIdentity=SqfEntitySequence(
  sequenceName: 'identity'
);
@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'AptekaPocketDbModel', // optional
    databaseName: 'aptekapocket.db',
    databaseTables: [tableMedicament],
    bundledDatabasePath: null,
    sequences: [seqIdentity]);
