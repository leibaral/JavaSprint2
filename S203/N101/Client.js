
db.createCollection( 'Client', {validator: {$jsonSchema: {bsonType: 'object',title:'Client',required: [         'nom',          'adreça',          'telefon',          'email',          'data_registre',          'recomanat'],properties: {nom: {bsonType: 'string'},adreça: {bsonType: 'object',
title:'object',required: [         'carrer',          'numero',          'pis',          'ciutat',          'codi_postal',          'pais'],properties: {carrer: {bsonType: 'string'},numero: {bsonType: 'string'},pis: {bsonType: 'string'},porta: {bsonType: 'string'},ciutat: {bsonType: 'string'},codi_postal: {bsonType: 'string'},pais: {bsonType: 'string'}}},telefon: {bsonType: 'string'},email: {bsonType: 'string'},data_registre: {bsonType: 'date'},recomanat: {bsonType: 'bool'},client_recomanador: {bsonType: 'object',
title:'object',}}         }      },
autoIndexId:true
});  