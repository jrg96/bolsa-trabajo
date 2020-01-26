CREATE TABLE Categorias (
  id NUMBER(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre VARCHAR2(100) NOT NULL,
  descripcion CLOB NOT NULL
);

ALTER TABLE Categorias ADD (
  CONSTRAINT categoria_id_pk PRIMARY KEY (id));



CREATE TABLE Perfiles (
  id NUMBER(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  perfil VARCHAR2(100) NOT NULL
);

ALTER TABLE Perfiles ADD (
  CONSTRAINT perfil_id_pk PRIMARY KEY (id));






CREATE TABLE Usuarios (
  id NUMBER(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre VARCHAR2(45) NOT NULL,
  email VARCHAR2(100) NOT NULL,
  username VARCHAR2(45) NOT NULL,
  password VARCHAR2(100) NOT NULL,
  estatus NUMBER(11) DEFAULT 1 NOT NULL,
  fechaRegistro date DEFAULT NULL
);

ALTER TABLE Usuarios ADD (
  CONSTRAINT usuario_id_pk PRIMARY KEY (id));

ALTER TABLE Usuarios ADD
  CONSTRAINT unique_username UNIQUE (username);
 
ALTER TABLE Usuarios ADD
  CONSTRAINT unique_email UNIQUE (email);
  




CREATE TABLE Vacantes (
  id NUMBER(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre VARCHAR2(200) NOT NULL,
  descripcion CLOB NOT NULL,
  fecha DATE NOT NULL,
  salario NUMBER(6,2) NOT NULL,
  estatus VARCHAR2(100) CHECK (estatus IN('Creada','Aprobada','Eliminada')) NOT NULL,
  destacado NUMBER(11) NOT NULL,
  imagen VARCHAR2(250) NOT NULL,
  detalles CLOB,
  idCategoria NUMBER(11) NOT NULL
);


ALTER TABLE Vacantes ADD (
  CONSTRAINT vacante_id_pk PRIMARY KEY (id));

ALTER TABLE Vacantes
ADD CONSTRAINT vacante_id_cat_fk
   FOREIGN KEY (idCategoria)
   REFERENCES Categorias(id);





CREATE TABLE Solicitudes (
  id NUMBER(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  fecha DATE NOT NULL,
  archivo VARCHAR2(250) NOT NULL,
  comentarios CLOB,
  idVacante NUMBER(11) NOT NULL,
  idUsuario NUMBER(11) NOT NULL
);

ALTER TABLE Solicitudes ADD (
  CONSTRAINT solicitud_id_pk PRIMARY KEY (id));

ALTER TABLE Solicitudes ADD
  CONSTRAINT unique_vacan_usu UNIQUE (idVacante, idUsuario);

ALTER TABLE Solicitudes
ADD CONSTRAINT soli_id_vacan_fk
   FOREIGN KEY (idVacante)
   REFERENCES Vacantes(id);

ALTER TABLE Solicitudes
ADD CONSTRAINT soli_id_usu_fk
   FOREIGN KEY (idUsuario)
   REFERENCES Usuarios(id);





CREATE TABLE UsuarioPerfil (
  idUsuario NUMBER(11) NOT NULL,
  idPerfil NUMBER(11) NOT NULL
);

ALTER TABLE UsuarioPerfil ADD
  CONSTRAINT unique_usuperf UNIQUE (idUsuario, idPerfil);

ALTER TABLE UsuarioPerfil
ADD CONSTRAINT usuperf_id_usu_fk
   FOREIGN KEY (idUsuario)
   REFERENCES Usuarios(id);

ALTER TABLE UsuarioPerfil
ADD CONSTRAINT usuperf_id_perf_fk
   FOREIGN KEY (idPerfil)
   REFERENCES Perfiles(id);
