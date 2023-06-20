
db.createCollection( 'Proveidor', {validator: {$jsonSchema: {bsonType: 'object',title:'Proveidor',required: [         'nom',          'adreça',          'telefon',          'nif',          'marca_ulleres'],properties: {nom: {bsonType: 'string'},adreça: {bsonType: 'object',
title:'object',required: [         'carrer',          'numero',          'pis',          'ciutat',          'codi_postal',          'pais'],properties: {carrer: {bsonType: 'string'},numero: {bsonType: 'string'},pis: {bsonType: 'string'},porta: {bsonType: 'string'},ciutat: {bsonType: 'string'},codi_postal: {bsonType: 'string'},pais: {bsonType: 'string'}}},telefon: {bsonType: 'string'},fax: {bsonType: 'string'},nif: {bsonType: 'string'},marca_ulleres: {bsonType: 'array',items: {}}}         }      },
autoIndexId:true
});  