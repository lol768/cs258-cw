/**
 * Seed the damn thing
 */

insert into MODULE values ('Database systems', 'CS258', 'DCS');
insert into MODULE values ('Programming for CS', 'CS118', 'DCS');
insert into MODULE values ('Tensors, Spinors and Rotations', 'MA3J1', 'Mathematics');
insert into MODULE values ('Using Computers', 'IB242', 'WBS');

insert into MODULE values ('Advanced Tractors', 'AG101', 'School of Agriculture');
insert into MODULE values ('Grass and wheat', 'AG102', 'School of Agriculture');

insert into STUDENT values ('John Deere', '0001', 'Agricultural Studies', 1);
insert into STUDENT values ('David Smith', '0002', 'Mathematics', 2);
insert into STUDENT values ('Joseph Bloggs', '0003', 'Computer Science', 3);
insert into STUDENT values ('Matt Smith', '0004', 'French', 3);
insert into STUDENT values ('Thomas Law', '0005', 'German Culture', 1);

/* should fail */
insert into EXAM values ('0001', 'AG101', 2010, 0);

insert into HISTORY values ('AG101', 2011, 'JCB Ltd');
insert into EXAM values ('0001', 'AG101', 2011, 0);

delete from MODULE;
delete from STUDENT;
