
db.createCollection( 'usuari', {validator: {$jsonSchema: {bsonType: 'object',title:'usuari',required: [         'nom',          'email',          'password',          'naixement',          'playlist'],properties: {nom: {bsonType: 'string'},email: {bsonType: 'string'},password: {bsonType: 'string'},naixement: {bsonType: 'date'},sexe: {bsonType: 'date'},codi_postal: {bsonType: 'date'},playlist: {bsonType: 'array',items: {
title:'object',required: [         'nom',          'publica',          'data_publicacio'],properties: {nom: {bsonType: 'string'},publica: {bsonType: 'bool'},data_publicacio: {bsonType: 'date'}}}}}         }      }});  