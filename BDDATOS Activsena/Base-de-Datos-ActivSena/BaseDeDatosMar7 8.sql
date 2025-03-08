-- CREAR BASE DE DATOS Y USARLA
DROP DATABASE BaseDeDatosMar7;

CREATE DATABASE BaseDeDatosMar7;

USE BaseDeDatosMar7;

-- Normalizacion de los nombres de las tabla y de los campos.
-- TABLA: TablaRoles 
CREATE TABLE
  RolUsuario (
    IdRol INT AUTO_INCREMENT NOT NULL,
    NombreRol ENUM("Administrador", "Aprendiz", "Instructor") NOT NULL, -- Agregar los roles que sean necesarios
    CONSTRAINT PK_IdRol PRIMARY KEY (IdRol)
  );

-- TABLA: TablaGestionE
CREATE TABLE
  GestionEvento (
    IdGestionE INT AUTO_INCREMENT NOT NULL,
    Aprobar ENUM("Aprobado", "Pendiente"), -- Agregar los valores que sean necesarios
    CONSTRAINT Pk_IdGestionE PRIMARY KEY (IdGestionE)
  );

-- TABLA: TablaUsuarios
CREATE TABLE
  Usuario (
  IdUsuario INT AUTO_INCREMENT NOT NULL,
    IdentificacionUsuario VARCHAR(50) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Correo VARCHAR(255) NOT NULL UNIQUE,
    Telefono VARCHAR(20),
    Contraseña VARCHAR(255) NOT NULL,
    FechaRegistro DATE NOT NULL,
    IdRol INT,
    CONSTRAINT Pk_IdUsuario PRIMARY KEY (IdUsuario),
    CONSTRAINT Fk_IdRolUsua FOREIGN KEY (IdRol) REFERENCES RolUsuario (IdRol) ON DELETE CASCADE ON UPDATE CASCADE -- Hacer en todas la llaves foraneas
  );

CREATE TABLE
  AlquilerElementos (
    IdAlquiler INT NOT NULL AUTO_INCREMENT,
    NombreElemento VARCHAR(50) NOT NULL,
    FechaSolicitud DATETIME NOT NULL,
    FechaDevolucion DATETIME NOT NULL,
    RegistradoPor varchar(50) not null,
    Observaciones TEXT NULL,
    IdUsuario INT,
    CONSTRAINT Pk_id_alquiler PRIMARY KEY (IdAlquiler),
    CONSTRAINT Fk_IdUsuaAlqEl FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario) ON DELETE CASCADE ON UPDATE CASCADE
  );

-- TABLA: TablaPlanificacionE
CREATE TABLE
  PlanificacionEvento (
    IdPlanificarE INT AUTO_INCREMENT NOT NULL,
    NombreEvento VARCHAR(150) NOT NULL,
    FechaEvento DATETIME NOT NULL,
    LugarDeEvento VARCHAR(50) NOT NULL,
    Recursos TEXT,
    IdGestionE INT NOT NULL,
    CONSTRAINT Pk_IdPlanificarE PRIMARY KEY (IdPlanificarE),
    CONSTRAINT Fk_IdGestionE FOREIGN KEY (IdGestionE) REFERENCES GestionEvento (IdGestionE) 
    ON DELETE CASCADE ON UPDATE CASCADE
  );

-- TABLA: TablaEventos
CREATE TABLE
  Evento (
    IdEvento INT AUTO_INCREMENT NOT NULL,
    NombreEvento VARCHAR(255) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    HoraFin TIME NOT NULL,
    HoraInicio TIME NOT NULL,
    UbicacionEvento VARCHAR(255) NOT NULL,
    IdPlanificarE INT,
    DescripcionEvento TEXT,
    CONSTRAINT Pk_IdEvento  PRIMARY KEY (IdEvento),
    CONSTRAINT Fk_PlanificacionEv FOREIGN KEY (IdPlanificarE) REFERENCES PlanificacionEvento (IdPlanificarE)
  );

-- TABLA: TablaActividades
CREATE TABLE
  Actividad (
    IdActividad INT AUTO_INCREMENT NOT NULL,
    NombreActi VARCHAR(150) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    HoraFin TIME NOT NULL,
    HoraInicio TIME NOT NULL,
    TipoLudica VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    IdEvento INT,
    CONSTRAINT Pk_IdActividades PRIMARY KEY (IdActividad),
    CONSTRAINT Fk_IdEventoActivi FOREIGN KEY (IdEvento) REFERENCES Evento (IdEvento) ON DELETE CASCADE ON UPDATE CASCADE
  );

-- TABLA: TablaAsistencia
CREATE TABLE
  Asistencia (
    AsiId INT AUTO_INCREMENT NOT NULL,
    AsiFecha DATETIME NOT NULL,
    AsiHorasAsistidas INT,
    QREntrada VARCHAR(100) NOT NULL,
    QRSalida VARCHAR(100) NOT NULL,
    IdUsuario INT,
    IdActividad INT,
    CONSTRAINT Pk_AsiId PRIMARY KEY (AsiId),
    CONSTRAINT Fk_IdUSuarioAsis FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Fk_ActividadesAsis FOREIGN KEY (IdActividad) REFERENCES Actividad (IdActividad) 
    ON DELETE CASCADE ON UPDATE CASCADE
  );

-- TABLA: TablaCertificado
CREATE TABLE
  Constancia (
    ConstanciaId INT AUTO_INCREMENT NOT NULL,
    ConstanciaHorasCert INT,
    ConstanciaEstado ENUM("Aprobado", "Pendiente"), -- Agregar mas si es necesario
    ConstanciaFecha DATETIME,
    IdUsuario INT,
    CONSTRAINT Pk_ConstanciaId PRIMARY KEY (ConstanciaId),
    CONSTRAINT Fk_IdentificacionU FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario) ON DELETE CASCADE ON UPDATE CASCADE
  );

-- TABLA: TablaConsultaIA
CREATE TABLE
  ConsultaIA (
    IdConsultaIA INT AUTO_INCREMENT NOT NULL,
    Pregunta TEXT NOT NULL,
    Respuesta TEXT NOT NULL,
    Fecha DATE NOT NULL,
    Descripcion TEXT,
    IdUsuario INT,
    CONSTRAINT Pk_IdConsultaIa PRIMARY KEY (IdConsultaIa),
    CONSTRAINT Fk_IdUsuaConsul FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
    ON DELETE CASCADE ON UPDATE CASCADE
  );

-- TABLA: TablaNotificaciones
CREATE TABLE
  Notificaciones (
    IdNotificacion INT AUTO_INCREMENT NOT NULL,
    Mensaje TEXT NOT NULL,
    -- TiposNotificaciones INT, NO SE POR QUE RESIVE UN ENTERO
    TiposNotificacion ENUM("Evento", "Actividad","Anuncio"),
    FechaDeEnvio DATE NOT NULL,
    IdEvento INT,
    CONSTRAINT Pk_IdNotificacion PRIMARY KEY (IdNotificacion),
    CONSTRAINT Fk_IdEventoNoti FOREIGN KEY (IdEvento) REFERENCES Evento (IdEvento) 
    ON DELETE CASCADE ON UPDATE CASCADE
  );

-- TABLA: TablaFeedback
CREATE TABLE
  Feedback (
    IdFeedback INT AUTO_INCREMENT NOT NULL,
    ComentarioFeedback TEXT NOT NULL,
    FechaEnvio DATETIME,
    CONSTRAINT Pk_IdFeedback PRIMARY KEY (IdFeedback)
  );

-- TABLA: RelUsuariosFeedback 
CREATE TABLE RelUsuarioFeedback (
  IdUsuario INT NOT NULL,
  IdFeedback INT NOT NULL,
  FechaRelUsuaFeed DATE,
  CONSTRAINT Fk_IdUsuaFeed FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Fk_IdFeedbackUsua FOREIGN KEY (IdFeedback) REFERENCES Feedback (IdFeedback) ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLA: RelUsuario_Eventos
CREATE TABLE
  RelUsuarioEvento (
    IdUsuario INT NOT NULL,
    IdEvento INT NOT NULL,
    CONSTRAINT Fk_IdUsuaEven FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Fk_IdEvenUsua FOREIGN KEY (IdEvento) REFERENCES Evento (IdEvento)ON DELETE CASCADE ON UPDATE CASCADE
  )