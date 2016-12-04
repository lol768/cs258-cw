
/**
 * Create the student table.
 *
 * This one isn't very interesting, the data types
 * are taken directly from the assignment document
 * and the fields just from the provided figure.
 */
create table STUDENT (
  Student_name varchar(30),
  Student_id char(4) primary key,
  Course_name varchar(30),
  Year smallint
);


/**
 * Create the module table.
 *
 * Again, similarly simple. The data types are taken directly
 * from the assignment document and the fields from the provided
 * figure.
 */
create table MODULE (
  Module_name varchar(30),
  Module_code varchar(6) primary key,
  Department_name varchar(30)
);

/**
 * Create the history table.
 *
 * This one is more interesting, we need to ensure that the
 * Module_code is valid per the specification:
 * "HISTORY and EXAM records may only contain data about modules
 *  listed in MODULE..."
 */
create table HISTORY (
  /**
   * Standard fields using
   * the suggested data types.
   */
  Module_code varchar(6),
  Delivery_year smallint,
  Organiser_name varchar(30),

  /**
   * Ensure the module code references a valid module (i.e. one defined in the module table).
   */
  constraint fk_history_module_module_code foreign key(Module_code) references MODULE(Module_code),

  /**
   * An item in this table is uniquely identified by a composite key
   * made up of the code and the year of delivery. I am assuming
   * modules cannot run twice with different organisers.
   */
  constraint pk_history_entry primary key(Module_code, Delivery_year)
);

/**
 * Create the exam table.
 *
 * This one has some more interesting
 * constraints. We need to ensure that
 * the module actually ran this year,
 * the student is real and the module
 * is also valid.
 */
create table EXAM (
  Student_id char(4),
  Module_code varchar(6),
  Exam_year smallint,
  Score smallint,

  /**
   * Ensure that there is a student with this id
   * in the students table. This is per the specification
   * which states:
   * "HISTORY and EXAM records may only contain data about [...]
   *  students from STUDENT"
   */
  constraint fk_exam_student_student_id foreign key(Student_id) references STUDENT(Student_id),

  /**
   * "HISTORY and EXAM records may only contain data about modules
   *  listed in MODULE..."
   */
  constraint fk_exam_module_module_code foreign key(Module_code) references MODULE(Module_code),

  /**
   * "Similarly, EXAM and HISTORY should be consistent
   *  in that an exam entry should only mention modules
   *  that actually ran"
   */
  constraint fk_exam_module_ran foreign key(Module_code, Exam_year) references HISTORY(Module_code, Delivery_year),

  /**
   * Prevent dupes!
   * We assume retakes are not possible per the spec.
   */
  constraint pk_exam_entry primary key(Module_code, Exam_year, Student_id)
);
