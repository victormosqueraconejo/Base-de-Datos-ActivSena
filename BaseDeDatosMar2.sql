-- CREAR BASE DE DATOS Y USARLA

DROP DATABASE BaseDeDatosMar2;

CREATE DATABASE BaseDeDatosMar2;

USE BaseDeDatosMar2; 

-- Normalizacion de los nombres de las tabla y de los campos.

-- TABLA: TablaRoles
CREATE TABLE
  TablaRoles (
    IdRoles VARCHAR(50) NOT NULL,
    NombreRol VARCHAR(25) NOT NULL,
    CONSTRAINT PK_IdRoles PRIMARY KEY (IdRoles)
  );

-- TABLA: TablaEventos
CREATE TABLE
  TablaEventos (
    IdEventos VARCHAR(50) NOT NULL,
    NombreEvento VARCHAR(255) NOT NULL,
    FechaEvento DATE NOT NULL,
    UbicacionEvento VARCHAR(255) NOT NULL,
    DescripcionEvento TEXT,
    CONSTRAINT Pk_IdEventos PRIMARY KEY (IdEventos)
  );

-- TABLA: TablaUsuarios
CREATE TABLE
  TablaUsuarios (
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Correo VARCHAR(255) NOT NULL UNIQUE,
    Telefono BIGINT,
    Contraseña VARCHAR(255) NOT NULL,
    FechaRegistro DATE NOT NULL,
    IdRoles VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_Identificacion PRIMARY KEY (IdentificacionUsuario),
    CONSTRAINT Fk_IdRoles FOREIGN KEY (IdRoles) REFERENCES TablaRoles (IdRoles)
  );

CREATE TABLE TablaAlquilerElementos (
     IdAlquiler CHAR(10) NOT NULL,
     NombreElemento VARCHAR(50) NOT NULL,
    FechaSolicitud DATETIME NOT NULL,
    FechaDevolucion DATETIME NOT NULL,
    RegistradoPor varchar(50) not null,
    Observaciones TEXT NULL,
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_id_alquiler PRIMARY KEY (IdAlquiler),
    CONSTRAINT Fk_IdentificacionAlqEl FOREIGN KEY (IdentificacionUsuario) REFERENCES TablaUsuarios(IdentificacionUsuario)
);


-- TABLA: TablaAsistencia
CREATE TABLE
  TablaAsistencia (
    AsiId CHAR(10) NOT NULL,
    AsiFecha DATE,
    AsiHorasAsistidas INT,
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_AsiId PRIMARY KEY (AsiId),
    CONSTRAINT Fk_Identificacion FOREIGN KEY (IdentificacionUsuario) REFERENCES TablaUsuarios (IdentificacionUsuario)
  );

-- TABLA: TablaLudicas
CREATE TABLE
  TablaLudicas (
    IdLudica VARCHAR(50) NOT NULL,
    RegistroLudica DATE NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    DescripcionLudicas VARCHAR(255),
    TipoLudicas VARCHAR(50) NOT NULL,
    IdEventos VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdLudica PRIMARY KEY (IdLudica),
    CONSTRAINT Fk_IdEventosN FOREIGN KEY (IdEventos) REFERENCES TablaEventos (IdEventos)
  );

-- TABLA: TablaCertificado
CREATE TABLE
  TablaCertificado (
    CertificadoId CHAR(12) NOT NULL,
    CertificadoHorasCert INT,
    CertificadoEstado VARCHAR(50) NOT NULL,
    CertificadoFecha DATETIME,
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_CertificadoId PRIMARY KEY (CertificadoId),
    CONSTRAINT Fk_IdentificacionU FOREIGN KEY (IdentificacionUsuario) REFERENCES TablaUsuarios (IdentificacionUsuario)
  );

-- TABLA: TablaConsultaIA
CREATE TABLE
  TablaConsultaIA (
    IdConsultaIa VARCHAR(50) NOT NULL,
    Pregunta TEXT NOT NULL,
    Respuesta TEXT NOT NULL,
    Fecha DATE NOT NULL,
    Descripcion TEXT,
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdConsultaIa PRIMARY KEY (IdConsultaIa),
    CONSTRAINT Fk_IdentificacionA FOREIGN KEY (IdentificacionUsuario) REFERENCES TablaUsuarios (IdentificacionUsuario)
  );

-- TABLA: TablaNotificaciones
CREATE TABLE
  TablaNotificaciones (
    IdNotificaciones VARCHAR(50) NOT NULL,
    Mensaje TEXT NOT NULL,
    TiposNotificaciones INT,
    FechaDeEnvio DATE NOT NULL,
    IdEventos VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdNotificaciones PRIMARY KEY (IdNotificaciones),
    CONSTRAINT Fk_IdEventos FOREIGN KEY (IdEventos) REFERENCES TablaEventos (IdEventos)
  );

-- TABLA: TablaCalendario
CREATE TABLE
  TablaCalendario (
    IdCalendario VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    IdEventos VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdCalendario PRIMARY KEY (IdCalendario),
    CONSTRAINT Fk_IdEventosA FOREIGN KEY (IdEventos) REFERENCES TablaEventos (IdEventos)
  );

-- TABLA: TablaHorarios
CREATE TABLE
  TablaHorarios (
    IdHorarios VARCHAR(50) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    IdEventos VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdHorarios PRIMARY KEY (IdHorarios),
    CONSTRAINT Fk_IdEventosE FOREIGN KEY (IdEventos) REFERENCES TablaEventos (IdEventos)
  );


-- TABLA: TablaCodigosQR
CREATE TABLE
  TablaCodigosQR (
    IdCodigoQr VARCHAR(50),
    Codigo VARCHAR(100) NOT NULL,
    IdLudica VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdCodigoQr PRIMARY KEY (IdCodigoQr),
    CONSTRAINT Fk_IdLudicaS FOREIGN KEY (IdLudica) REFERENCES TablaLudicas (IdLudica)
  );

-- TABLA: TablaFeedback
CREATE TABLE
  TablaFeedback (
    IdFeedback VARCHAR(50) NOT NULL,
    ComentarioFeedback TEXT NOT NULL,
    FechaEnvio TIMESTAMP,
    CONSTRAINT Pk_IdFeedback PRIMARY KEY (IdFeedback)
  );

-- TABLA: TablaActividades
CREATE TABLE
  TablaActividades (
    IdActividades VARCHAR(50) NOT NULL,
    NombreActi VARCHAR(150) NOT NULL,
    FechaActividad DATE NOT NULL,
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdActividades PRIMARY KEY (IdActividades),
    CONSTRAINT Fk_IdentificacionS FOREIGN KEY (IdentificacionUsuario) REFERENCES TablaUsuarios (IdentificacionUsuario)
  );

-- TABLA: TablaGestionE
CREATE TABLE
  TablaGestionE (
    IdGestionE VARCHAR(50) NOT NULL,
    Aprobar TEXT NOT NULL,
    CONSTRAINT Pk_IdGestionE PRIMARY KEY (IdGestionE)
  );

-- TABLA: TablaPlanificacionE
CREATE TABLE
  TablaPlanificacionE (
    IdPlanificarE VARCHAR(50) NOT NULL,
    NombreEvento VARCHAR(150) NOT NULL,
    FechaEvento DATETIME NOT NULL,
    IdEventos VARCHAR(50) NOT NULL,
    IdGestionE VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_IdPlanificarE PRIMARY KEY (IdPlanificarE),
    CONSTRAINT Fk_IdEventosS FOREIGN KEY (IdEventos) REFERENCES TablaEventos (IdEventos),
    CONSTRAINT Fk_IdGestionE FOREIGN KEY (IdGestionE) REFERENCES TablaGestionE (IdGestionE)
  );

-- TABLA: RelUsuariosFeedback
CREATE TABLE
  RelUsuariosFeedback (
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    IdFeedback VARCHAR(50) NOT NULL,
    CONSTRAINT Fk_IdentificacionO FOREIGN KEY (IdentificacionUsuario) REFERENCES TablaUsuarios (IdentificacionUsuario),
    CONSTRAINT Fk_IdFeedback FOREIGN KEY (IdFeedback) REFERENCES TablaFeedback (IdFeedback)
  );

-- TABLA: RelUsuario_Eventos
CREATE TABLE
  RelUsuarioEventos (
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    IdEventos VARCHAR(50) NOT NULL,
    CONSTRAINT Fk_Identificacione FOREIGN KEY (IdentificacionUsuario) REFERENCES TablaUsuarios (IdentificacionUsuario),
    CONSTRAINT Fk_IdEventosoo FOREIGN KEY (IdEventos) REFERENCES TablaEventos (IdEventos)
  );

-- TABLA: RelAsistencia_Ludicas
CREATE TABLE
  RelAsistenciaLudicas (
   AsiId CHAR(10) NOT NULL,
    IdLudica VARCHAR(50) NOT NULL,
    CONSTRAINT Fk_AsiID FOREIGN KEY (AsiId) REFERENCES TablaAsistencia (AsiId),
    CONSTRAINT Fk_IdLudicasa FOREIGN KEY (IdLudica) REFERENCES TablaLudicas (IdLudica)
  );

