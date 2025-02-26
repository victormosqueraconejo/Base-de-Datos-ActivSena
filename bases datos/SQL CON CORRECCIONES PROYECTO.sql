CREATE DATABASE sena27;
USE sena27;


-- Eliminar la tabla "tablahorasasis" y corregir la relaicon de tabla asistencia y relhorasasistidas_ludicas


-- TABLA: TablaRoles
CREATE TABLE TablaRoles(
  IdRoles VARCHAR(50) NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  CONSTRAINT PK_IdRoles PRIMARY KEY (IdRoles)
);

-- TABLA: TablaEventos
CREATE TABLE TablaEventos (
  IdEventos VARCHAR(50) NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  fecha DATE NOT NULL,
  ubicacion VARCHAR(255) NOT NULL,
  descripcion TEXT,
  CONSTRAINT Pk_IdEventos PRIMARY KEY(IdEventos)
);

-- TABLA: TablaUsuarios
CREATE TABLE TablaUsuarios(
  Identificacion VARCHAR(50) NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  Correo VARCHAR(255) NOT NULL UNIQUE,
  Telefono BIGINT,
  Contraseña VARCHAR(255) NOT NULL,
  FechaRegistro DATE NOT NULL,
  IdRoles VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_Identificacion PRIMARY KEY (Identificacion),
  CONSTRAINT Fk_IdRoles FOREIGN KEY (IdRoles) REFERENCES TablaRoles(IdRoles)
);

-- TABLA: TablaAsistencia
CREATE TABLE TablaAsistencia (
  AsiId CHAR(10) NOT NULL,
  AsiFecha DATE,
  AsiHorasAsistidas INT,
  Identificacion VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_AsiId PRIMARY KEY(AsiId),
  CONSTRAINT Fk_Identificacion FOREIGN KEY (Identificacion) REFERENCES TablaUsuarios(Identificacion)
);

-- TABLA: TablaLudicas
CREATE TABLE TablaLudicas (-- Se necesita un nuevo campo para la fecha y hora en la que se registro la ludica.
  IdLudica VARCHAR(50) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(255),
  Fechas datetime not null,
  Hora_Registro TIME NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  IdEventos VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdLudica PRIMARY KEY (IdLudica),
  CONSTRAINT Fk_IdEventosN FOREIGN KEY (IdEventos) REFERENCES TablaEventos(IdEventos)
);

-- TABLA: TablaCertificado
CREATE TABLE TablaCertificado(
  CertificadoId CHAR(12) NOT NULL,
  CertificadoHorasCert INT,
  CertificadoEstado VARCHAR(50) NOT NULL,
  CertificadoFecha DATETIME,
  Identificacion VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_CertificadoId PRIMARY KEY (CertificadoId),
  CONSTRAINT Fk_IdentificacionU FOREIGN KEY(Identificacion) REFERENCES TablaUsuarios(Identificacion)
);

-- TABLA: TablaConsultaIA
CREATE TABLE TablaConsultaIA (
  IdConsultaIa VARCHAR(50) NOT NULL,
  pregunta TEXT NOT NULL,
  respuesta TEXT NOT NULL,
  fecha DATE NOT NULL,
  descripcion TEXT,
  Identificacion VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdConsultaIa PRIMARY KEY(IdConsultaIa),
  CONSTRAINT Fk_IdentificacionA FOREIGN KEY (Identificacion) REFERENCES TablaUsuarios(Identificacion)
);

-- TABLA: TablaNotificaciones
CREATE TABLE TablaNotificaciones (
  IdNotificaciones VARCHAR(50) NOT NULL,
  mensaje TEXT NOT NULL,
  Tipos_Notificaciones INT,
  fecha_de_envio DATE NOT NULL,
  IdEventos VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdNotificaciones PRIMARY KEY(IdNotificaciones),
  CONSTRAINT Fk_IdEventos FOREIGN KEY (IdEventos) REFERENCES TablaEventos(IdEventos)
);

-- TABLA: TablaCalendario
CREATE TABLE TablaCalendario (
  IdCalendario VARCHAR(50) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  IdEventos VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdCalendario PRIMARY KEY(IdCalendario),
  CONSTRAINT Fk_IdEventosA FOREIGN KEY (IdEventos) REFERENCES TablaEventos(IdEventos)
);

-- TABLA: TablaHorarios
CREATE TABLE TablaHorarios (
  IdHorarios VARCHAR(50) NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fin TIME NOT NULL,
  IdEventos VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdHorarios PRIMARY KEY(IdHorarios),
  CONSTRAINT Fk_IdEventosE FOREIGN KEY (IdEventos) REFERENCES TablaEventos(IdEventos)
);

-- TABLA: TablaHorasAsis


-- TABLA: TablaCodigosQR
CREATE TABLE TablaCodigosQR (
  IdCodigoQr VARCHAR(50),
  codigo VARCHAR(100) NOT NULL,
  IdLudica VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdCodigoQr PRIMARY KEY(IdCodigoQr),
  CONSTRAINT Fk_IdLudicaS FOREIGN KEY (IdLudica) REFERENCES TablaLudicas(IdLudica)
);

-- TABLA: TablaFeedback
CREATE TABLE TablaFeedback (
  IdFeedback VARCHAR(50) NOT NULL,
  ComentarioFeedback TEXT NOT NULL,
  FechaEnvio TIMESTAMP,
  CONSTRAINT Pk_IdFeedback PRIMARY KEY (IdFeedback)
);

-- TABLA: TablaActividades
CREATE TABLE TablaActividades(
  IdActividades VARCHAR(50) NOT NULL,
  NombreActi VARCHAR(150) NOT NULL,
  FechaActividad DATE NOT NULL,
  Identificacion VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdActividades PRIMARY KEY(IdActividades),
  CONSTRAINT Fk_IdentificacionS FOREIGN KEY (Identificacion) REFERENCES TablaUsuarios(Identificacion)
);

-- TABLA: TablaGestionE
CREATE TABLE TablaGestionE(
  IdGestionE VARCHAR(50) NOT NULL,
  Aprobar TEXT NOT NULL,
  CONSTRAINT Pk_IdGestionE PRIMARY KEY(IdGestionE)
);

-- TABLA: TablaPlanificacionE
CREATE TABLE TablaPlanificacionE(
  IdPlanificarE VARCHAR(50) NOT NULL,
  NombreEvento VARCHAR(150) NOT NULL,
  FechaEvento DATETIME NOT NULL,
  IdEventos VARCHAR(50) NOT NULL,
  IdGestionE VARCHAR(50) NOT NULL,
  CONSTRAINT Pk_IdPlanificarE PRIMARY KEY(IdPlanificarE),
  CONSTRAINT Fk_IdEventosS FOREIGN KEY(IdEventos) REFERENCES TablaEventos(IdEventos),
  CONSTRAINT Fk_IdGestionE FOREIGN KEY(IdGestionE) REFERENCES TablaGestionE(IdGestionE)
);

-- TABLA: RelUsuariosFeedback
CREATE TABLE RelUsuariosFeedback(
  Identificacion VARCHAR(50) NOT NULL,
  IdFeedback VARCHAR(50) NOT NULL,
  CONSTRAINT Fk_IdentificacionO FOREIGN KEY (Identificacion) REFERENCES TablaUsuarios(Identificacion),
  CONSTRAINT Fk_IdFeedback FOREIGN KEY (IdFeedback) REFERENCES TablaFeedback(IdFeedback)
);

-- TABLA: RelUsuario_Eventos
CREATE TABLE RelUsuario_Eventos(
  Identificacion VARCHAR(50) NOT NULL,
  IdEventos VARCHAR(50) NOT NULL,
  CONSTRAINT Fk_Identificacione FOREIGN KEY (Identificacion) REFERENCES TablaUsuarios(Identificacion),
  CONSTRAINT Fk_IdEventosoo FOREIGN KEY (IdEventos) REFERENCES TablaEventos(IdEventos)
);


-----------------------------------------------------------
-- INSERTS INICIALES (3 registros de ejemplo) y 10 adicionales
-----------------------------------------------------------

-- TablaRoles
INSERT INTO TablaRoles (IdRoles, nombre) VALUES 
  ('R001', 'Administrador'),
  ('R002', 'Estudiante'),
  ('R003', 'Instructor'),
  ('R004', 'Coordinador'),
  ('R005', 'Profesor'),
  ('R006', 'Asistente'),
  ('R007', 'Director'),
  ('R008', 'Secretario'),
  ('R009', 'Investigador'),
  ('R010', 'Voluntario'),
  ('R011', 'Consultor'),
  ('R012', 'Técnico'),
  ('R013', 'Operador');

-- TablaEventos
INSERT INTO TablaEventos (IdEventos, nombre, fecha, ubicacion, descripcion)
VALUES 
  ('E001', 'Conferencia Tecnología', '2023-02-15', 'Auditorio Principal', 'Conferencia sobre nuevas tecnologías.'),
  ('E002', 'Feria de Empleo', '2023-03-10', 'Centro de Convenciones', 'Feria para conectar empleadores y buscadores de empleo.'),
  ('E003', 'Taller de Innovación', '2023-04-05', 'Sala de Innovación', 'Taller interactivo sobre metodologías innovadoras.'),
  ('E004', 'Seminario de Negocios', '2023-05-15', 'Sala de Conferencias', 'Seminario para emprendedores.'),
  ('E005', 'Exposición de Arte', '2023-06-10', 'Galería Central', 'Exposición de artistas locales.'),
  ('E006', 'Concierto de Rock', '2023-07-20', 'Estadio Municipal', 'Concierto en vivo con bandas reconocidas.'),
  ('E007', 'Feria de Ciencia', '2023-08-05', 'Centro de Exposiciones', 'Feria de proyectos científicos.'),
  ('E008', 'Torneo de Fútbol', '2023-09-10', 'Cancha Principal', 'Competencia deportiva entre equipos locales.'),
  ('E009', 'Cumbre Internacional', '2023-10-15', 'Hotel Continental', 'Reunión de líderes internacionales.'),
  ('E010', 'Festival Gastronómico', '2023-11-20', 'Plaza Mayor', 'Festival con exquisitos platos y chefs.'),
  ('E011', 'Conferencia Ambiental', '2023-12-05', 'Centro Cultural', 'Debate sobre medio ambiente.'),
  ('E012', 'Taller de Robótica', '2024-01-10', 'Laboratorio Tecnológico', 'Taller práctico de robótica.'),
  ('E013', 'Encuentro de Emprendedores', '2024-02-20', 'Centro de Innovación', 'Networking para emprendedores.');

-- TablaUsuarios
INSERT INTO TablaUsuarios 
  (Identificacion, Nombre, Apellido, Correo, Telefono, Contraseña, FechaRegistro, IdRoles)
VALUES
  ('2001', 'Alejandro', 'Ramírez', 'alejandro.ramirez@example.com', 3123456789, 'passAlejandro', '2023-05-10', 'R001'),
  ('2002', 'Isabel', 'Sánchez', 'isabel.sanchez@example.com', 3123456790, 'passIsabel', '2023-05-11', 'R002'),
  ('2003', 'Fernando', 'López', 'fernando.lopez@example.com', 3123456791, 'passFernando', '2023-05-12', 'R003'),
  ('2004', 'Carlos', 'Martinez', 'carlos.martinez@example.com', 3123456792, 'passCarlos', '2023-05-13', 'R004'),
  ('2005', 'Mariana', 'Gomez', 'mariana.gomez@example.com', 3123456793, 'passMariana', '2023-05-14', 'R005'),
  ('2006', 'Luis', 'Hernandez', 'luis.hernandez@example.com', 3123456794, 'passLuis', '2023-05-15', 'R006'),
  ('2007', 'Ana', 'Torres', 'ana.torres@example.com', 3123456795, 'passAna', '2023-05-16', 'R007'),
  ('2008', 'Jorge', 'Ramirez', 'jorge.ramirez@example.com', 3123456796, 'passJorge', '2023-05-17', 'R008'),
  ('2009', 'Laura', 'Castro', 'laura.castro@example.com', 3123456797, 'passLaura', '2023-05-18', 'R009'),
  ('2010', 'Miguel', 'Soto', 'miguel.soto@example.com', 3123456798, 'passMiguel', '2023-05-19', 'R010'),
  ('2011', 'Sofia', 'Diaz', 'sofia.diaz@example.com', 3123456799, 'passSofia', '2023-05-20', 'R011'),
  ('2012', 'Diego', 'Morales', 'diego.morales@example.com', 3123456800, 'passDiego', '2023-05-21', 'R012'),
  ('2013', 'Elena', 'Ramirez', 'elena.ramirez@example.com', 3123456801, 'passElena', '2023-05-22', 'R013');

-- TablaAsistencia
INSERT INTO TablaAsistencia (AsiId, AsiFecha, AsiHorasAsistidas, Identificacion)
VALUES
  ('A001', '2023-02-15', 3, '2001'),
  ('A002', '2023-02-15', 2, '2002'),
  ('A003', '2023-03-10', 4, '2003'),
  ('A004', '2023-06-01', 2, '2004'),
  ('A005', '2023-06-02', 3, '2005'),
  ('A006', '2023-06-03', 1, '2006'),
  ('A007', '2023-06-04', 4, '2007'),
  ('A008', '2023-06-05', 2, '2008'),
  ('A009', '2023-06-06', 3, '2009'),
  ('A010', '2023-06-07', 2, '2010'),
  ('A011', '2023-06-08', 3, '2011'),
  ('A012', '2023-06-09', 4, '2012'),
  ('A013', '2023-06-10', 1, '2013');

-- TablaLudicas
INSERT INTO TablaLudicas (IdLudica, Nombre, Descripcion, Tipo, IdEventos)
VALUES
  ('L001', 'Trivia Tech', 'Juego de preguntas sobre tecnología', 'Juego', 'E001'),
  ('L002', 'Simulación de Negocios', 'Actividad interactiva de simulación empresarial', 'Simulación', 'E002'),
  ('L003', 'Escape Room Innovador', 'Juego de escape con desafíos de innovación', 'Juego', 'E003'),
  ('L004', 'Quiz Empresarial', 'Juego de preguntas sobre negocios', 'Juego', 'E004'),
  ('L005', 'Adivina la Obra', 'Juego de adivinanzas sobre arte', 'Juego', 'E005'),
  ('L006', 'Rock Challenge', 'Competencia musical y de habilidades', 'Competencia', 'E006'),
  ('L007', 'Ciencia Divertida', 'Experimentos y retos científicos', 'Taller', 'E007'),
  ('L008', 'Fútbol Fantasy', 'Juego interactivo de simulación de fútbol', 'Juego', 'E008'),
  ('L009', 'Diplomacia Global', 'Simulación de negociaciones internacionales', 'Simulación', 'E009'),
  ('L010', 'Chef Master', 'Competencia culinaria interactiva', 'Competencia', 'E010'),
  ('L011', 'Eco Challenge', 'Juego de retos sobre sostenibilidad', 'Juego', 'E011'),
  ('L012', 'Robo Rally', 'Competencia de robots en circuito', 'Competencia', 'E012'),
  ('L013', 'Startup Simulator', 'Simulación de creación de empresas', 'Simulación', 'E013');

-- TablaCertificado
INSERT INTO TablaCertificado (CertificadoId, CertificadoHorasCert, CertificadoEstado, CertificadoFecha, Identificacion)
VALUES
  ('C001', 10, 'Aprobado', '2023-02-16 09:00:00', '2001'),
  ('C002', 8, 'Aprobado', '2023-02-16 10:00:00', '2002'),
  ('C003', 12, 'Pendiente', '2023-03-11 14:00:00', '2003'),
  ('C004', 9, 'Aprobado', '2023-06-11 09:00:00', '2004'),
  ('C005', 7, 'Pendiente', '2023-06-12 10:00:00', '2005'),
  ('C006', 11, 'Aprobado', '2023-06-13 11:00:00', '2006'),
  ('C007', 10, 'Aprobado', '2023-06-14 12:00:00', '2007'),
  ('C008', 8, 'Pendiente', '2023-06-15 13:00:00', '2008'),
  ('C009', 9, 'Aprobado', '2023-06-16 14:00:00', '2009'),
  ('C010', 7, 'Aprobado', '2023-06-17 15:00:00', '2010'),
  ('C011', 10, 'Pendiente', '2023-06-18 16:00:00', '2011'),
  ('C012', 12, 'Aprobado', '2023-06-19 17:00:00', '2012'),
  ('C013', 8, 'Pendiente', '2023-06-20 18:00:00', '2013');

-- TablaConsultaIA
INSERT INTO TablaConsultaIA (IdConsultaIa, pregunta, respuesta, fecha, descripcion, Identificacion)
VALUES
  ('CIA001', '¿Qué es inteligencia artificial?', 'La IA es la simulación de procesos de inteligencia humana por máquinas.', '2023-02-20', 'Consulta general sobre IA.', '2001'),
  ('CIA002', '¿Cómo aprender SQL?', 'Se recomienda practicar con bases de datos reales y cursos online.', '2023-02-21', 'Consulta sobre aprendizaje de SQL.', '2002'),
  ('CIA003', '¿Cuáles son los beneficios del aprendizaje online?', 'Acceso a recursos, flexibilidad y personalización.', '2023-02-22', 'Consulta sobre educación online.', '2003'),
  ('CIA004', '¿Qué es Big Data?', 'Big Data se refiere al manejo de grandes volúmenes de datos.', '2023-06-21', 'Consulta sobre Big Data.', '2004'),
  ('CIA005', '¿Cómo mejorar la seguridad informática?', 'Implementando protocolos de seguridad y actualizaciones constantes.', '2023-06-22', 'Consulta sobre ciberseguridad.', '2005'),
  ('CIA006', '¿Qué es blockchain?', 'Blockchain es una tecnología de registro descentralizado.', '2023-06-23', 'Consulta sobre blockchain.', '2006'),
  ('CIA007', '¿Cómo aprender Python?', 'Existen cursos online y tutoriales gratuitos.', '2023-06-24', 'Consulta sobre programación.', '2007'),
  ('CIA008', '¿Qué es Internet de las cosas?', 'Es la interconexión de dispositivos a través de internet.', '2023-06-25', 'Consulta sobre IoT.', '2008'),
  ('CIA009', '¿Cómo crear una startup?', 'Se requiere un plan de negocios y capital inicial.', '2023-06-26', 'Consulta sobre emprendimiento.', '2009'),
  ('CIA010', '¿Qué es la computación en la nube?', 'Es la entrega de servicios de computación a través de internet.', '2023-06-27', 'Consulta sobre cloud computing.', '2010'),
  ('CIA011', '¿Cómo mejorar mis habilidades de liderazgo?', 'A través de la formación y la experiencia práctica.', '2023-06-28', 'Consulta sobre liderazgo.', '2011'),
  ('CIA012', '¿Qué es el machine learning?', 'Es un subcampo de la IA que permite aprender de datos.', '2023-06-29', 'Consulta sobre machine learning.', '2012'),
  ('CIA013', '¿Cómo optimizar bases de datos?', 'Mediante índices y consultas optimizadas.', '2023-06-30', 'Consulta sobre optimización de bases de datos.', '2013');

-- TablaNotificaciones
INSERT INTO TablaNotificaciones (IdNotificaciones, mensaje, Tipos_Notificaciones, fecha_de_envio, IdEventos)
VALUES
  ('N001', 'Recordatorio de conferencia', 1, '2023-02-14', 'E001'),
  ('N002', 'Actualización de feria de empleo', 2, '2023-03-09', 'E002'),
  ('N003', 'Información sobre el taller', 1, '2023-04-04', 'E003'),
  ('N004', 'Recordatorio para seminario', 1, '2023-05-14', 'E004'),
  ('N005', 'Invitación a exposición de arte', 1, '2023-06-09', 'E005'),
  ('N006', 'Recordatorio de concierto', 1, '2023-07-19', 'E006'),
  ('N007', 'Aviso para feria de ciencia', 2, '2023-08-04', 'E007'),
  ('N008', 'Actualización sobre torneo de fútbol', 2, '2023-09-09', 'E008'),
  ('N009', 'Recordatorio para cumbre internacional', 1, '2023-10-14', 'E009'),
  ('N010', 'Invitación al festival gastronómico', 1, '2023-11-19', 'E010'),
  ('N011', 'Recordatorio para conferencia ambiental', 1, '2023-12-04', 'E011'),
  ('N012', 'Invitación a taller de robótica', 2, '2024-01-09', 'E012'),
  ('N013', 'Recordatorio para encuentro de emprendedores', 1, '2024-02-19', 'E013');

-- TablaCalendario
INSERT INTO TablaCalendario (IdCalendario, fecha, hora, nombre, IdEventos)
VALUES
  ('CAL001', '2023-02-15', '09:00:00', 'Inicio de la Conferencia', 'E001'),
  ('CAL002', '2023-03-10', '10:00:00', 'Apertura de la Feria', 'E002'),
  ('CAL003', '2023-04-05', '14:00:00', 'Inicio del Taller', 'E003'),
  ('CAL004', '2023-05-15', '08:00:00', 'Inicio del Seminario', 'E004'),
  ('CAL005', '2023-06-10', '11:00:00', 'Inicio de la Exposición', 'E005'),
  ('CAL006', '2023-07-20', '20:00:00', 'Inicio del Concierto', 'E006'),
  ('CAL007', '2023-08-05', '09:00:00', 'Inicio de la Feria de Ciencia', 'E007'),
  ('CAL008', '2023-09-10', '17:00:00', 'Inicio del Torneo de Fútbol', 'E008'),
  ('CAL009', '2023-10-15', '18:00:00', 'Inicio de la Cumbre Internacional', 'E009'),
  ('CAL010', '2023-11-20', '12:00:00', 'Inicio del Festival Gastronómico', 'E010'),
  ('CAL011', '2023-12-05', '10:00:00', 'Inicio de la Conferencia Ambiental', 'E011'),
  ('CAL012', '2024-01-10', '15:00:00', 'Inicio del Taller de Robótica', 'E012'),
  ('CAL013', '2024-02-20', '13:00:00', 'Inicio del Encuentro de Emprendedores', 'E013');

-- TablaHorarios
INSERT INTO TablaHorarios (IdHorarios, hora_inicio, hora_fin, IdEventos)
VALUES
  ('H001', '09:00:00', '12:00:00', 'E001'),
  ('H002', '10:00:00', '15:00:00', 'E002'),
  ('H003', '14:00:00', '18:00:00', 'E003'),
  ('H004', '08:00:00', '11:00:00', 'E004'),
  ('H005', '11:00:00', '14:00:00', 'E005'),
  ('H006', '19:00:00', '22:00:00', 'E006'),
  ('H007', '09:00:00', '12:00:00', 'E007'),
  ('H008', '16:00:00', '19:00:00', 'E008'),
  ('H009', '17:00:00', '20:00:00', 'E009'),
  ('H010', '12:00:00', '15:00:00', 'E010'),
  ('H011', '10:00:00', '13:00:00', 'E011'),
  ('H012', '14:00:00', '17:00:00', 'E012'),
  ('H013', '13:00:00', '16:00:00', 'E013');

-- TablaHorasAsis


-- TablaCodigosQR
INSERT INTO TablaCodigosQR (IdCodigoQr, codigo, IdLudica)
VALUES
  ('QR001', 'QR-CODE-12345', 'L001'),
  ('QR002', 'QR-CODE-67890', 'L002'),
  ('QR003', 'QR-CODE-ABCDE', 'L003'),
  ('QR004', 'QR-CODE-11111', 'L004'),
  ('QR005', 'QR-CODE-22222', 'L005'),
  ('QR006', 'QR-CODE-33333', 'L006'),
  ('QR007', 'QR-CODE-44444', 'L007'),
  ('QR008', 'QR-CODE-55555', 'L008'),
  ('QR009', 'QR-CODE-66666', 'L009'),
  ('QR010', 'QR-CODE-77777', 'L010'),
  ('QR011', 'QR-CODE-88888', 'L011'),
  ('QR012', 'QR-CODE-99999', 'L012'),
  ('QR013', 'QR-CODE-00000', 'L013');

-- TablaFeedback
INSERT INTO TablaFeedback (IdFeedback, ComentarioFeedback, FechaEnvio)
VALUES
  ('F001', 'Excelente evento y organización.', '2023-02-17 11:00:00'),
  ('F002', 'La feria fue muy útil para encontrar empleo.', '2023-03-11 12:00:00'),
  ('F003', 'El taller fue interactivo y enriquecedor.', '2023-04-06 15:00:00'),
  ('F004', 'Muy buena organización del seminario.', '2023-05-16 10:00:00'),
  ('F005', 'La exposición de arte fue inspiradora.', '2023-06-11 11:00:00'),
  ('F006', 'El concierto superó las expectativas.', '2023-07-21 20:00:00'),
  ('F007', 'La feria de ciencia fue muy educativa.', '2023-08-06 09:30:00'),
  ('F008', 'El torneo de fútbol fue emocionante.', '2023-09-11 18:00:00'),
  ('F009', 'La cumbre internacional fue reveladora.', '2023-10-16 17:00:00'),
  ('F010', 'El festival gastronómico ofreció sabores únicos.', '2023-11-21 12:30:00'),
  ('F011', 'La conferencia ambiental generó buen debate.', '2023-12-06 10:15:00'),
  ('F012', 'El taller de robótica fue muy interactivo.', '2024-01-11 15:30:00'),
  ('F013', 'El encuentro de emprendedores fue inspirador.', '2024-02-21 13:45:00');

-- TablaActividades
INSERT INTO TablaActividades (IdActividades, NombreActi, FechaActividad, Identificacion)
VALUES
  ('ACT001', 'Seminario de Marketing', '2023-02-20', '2001'),
  ('ACT002', 'Taller de Programación', '2023-02-21', '2002'),
  ('ACT003', 'Curso de Diseño Gráfico', '2023-02-22', '2003'),
  ('ACT004', 'Workshop de Ventas', '2023-06-05', '2004'),
  ('ACT005', 'Conferencia de Innovación', '2023-06-06', '2005'),
  ('ACT006', 'Seminario de Finanzas', '2023-06-07', '2006'),
  ('ACT007', 'Taller de Comunicación', '2023-06-08', '2007'),
  ('ACT008', 'Curso de Fotografía', '2023-06-09', '2008'),
  ('ACT009', 'Taller de Diseño Web', '2023-06-10', '2009'),
  ('ACT010', 'Seminario de RRHH', '2023-06-11', '2010'),
  ('ACT011', 'Workshop de Desarrollo Personal', '2023-06-12', '2011'),
  ('ACT012', 'Curso de Inglés', '2023-06-13', '2012'),
  ('ACT013', 'Taller de Cocina', '2023-06-14', '2013');

-- TablaGestionE
INSERT INTO TablaGestionE (IdGestionE, Aprobar)
VALUES
  ('GE001', 'Aprobado'),
  ('GE002', 'Pendiente'),
  ('GE003', 'Aprobado'),
  ('GE004', 'Pendiente'),
  ('GE005', 'Aprobado'),
  ('GE006', 'Pendiente'),
  ('GE007', 'Aprobado'),
  ('GE008', 'Pendiente'),
  ('GE009', 'Aprobado'),
  ('GE010', 'Pendiente'),
  ('GE011', 'Aprobado'),
  ('GE012', 'Pendiente');

-- TablaPlanificacionE
INSERT INTO TablaPlanificacionE (IdPlanificarE, NombreEvento, FechaEvento, IdEventos, IdGestionE)
VALUES
  ('PE001', 'Planificación de Conferencia', '2023-02-14 08:00:00', 'E001', 'GE001'),
  ('PE002', 'Planificación de Feria', '2023-03-09 09:00:00', 'E002', 'GE002'),
  ('PE003', 'Planificación de Seminario de Negocios', '2023-05-15 07:00:00', 'E004', 'GE003'),
  ('PE004', 'Planificación de Exposición de Arte', '2023-06-10 09:00:00', 'E005', 'GE004'),
  ('PE005', 'Planificación de Concierto de Rock', '2023-07-20 18:00:00', 'E006', 'GE005'),
  ('PE006', 'Planificación de Feria de Ciencia', '2023-08-05 08:00:00', 'E007', 'GE006'),
  ('PE007', 'Planificación de Torneo de Fútbol', '2023-09-10 15:00:00', 'E008', 'GE007'),
  ('PE008', 'Planificación de Cumbre Internacional', '2023-10-15 16:00:00', 'E009', 'GE008'),
  ('PE009', 'Planificación de Festival Gastronómico', '2023-11-20 11:00:00', 'E010', 'GE009'),
  ('PE010', 'Planificación de Conferencia Ambiental', '2023-12-05 09:00:00', 'E011', 'GE010'),
  ('PE011', 'Planificación de Taller de Robótica', '2024-01-10 14:00:00', 'E012', 'GE011'),
  ('PE012', 'Planificación de Encuentro de Emprendedores', '2024-02-20 12:00:00', 'E013', 'GE012');

-- RelUsuariosFeedback
INSERT INTO RelUsuariosFeedback (Identificacion, IdFeedback)
VALUES
  ('2001', 'F001'),
  ('2002', 'F002'),
  ('2003', 'F003'),
  ('2004', 'F004'),
  ('2005', 'F005'),
  ('2006', 'F006'),
  ('2007', 'F007'),
  ('2008', 'F008'),
  ('2009', 'F009'),
  ('2010', 'F010'),
  ('2011', 'F011'),
  ('2012', 'F012'),
  ('2013', 'F013');

-- RelUsuario_Eventos
INSERT INTO RelUsuario_Eventos (Identificacion, IdEventos)
VALUES
  ('2001', 'E001'),
  ('2002', 'E002'),
  ('2003', 'E003'),
  ('2004', 'E004'),
  ('2005', 'E005'),
  ('2006', 'E006'),
  ('2007', 'E007'),
  ('2008', 'E008'),
  ('2009', 'E009'),
  ('2010', 'E010'),
  ('2011', 'E011'),
  ('2012', 'E012'),
  ('2013', 'E013');

-- RelHorasAsitidas_Ludicas
