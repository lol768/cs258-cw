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
insert into HISTORY values ('AG101', 2011, 'JCB Ltd');
insert into HISTORY values ('AG101', 2015, 'Oh Deere');
insert into HISTORY values ('CS118', 2012, 'Steven Wright');
insert into HISTORY values ('AG102', 2012, 'Mr Farm');
insert into HISTORY values ('MA3J1', 2012, 'Mr Maths');
insert into EXAM values ('0002', 'AG101', 2011, 0);
insert into EXAM values ('0005', 'AG101', 2015, 0);

insert into EXAM values ('0001', 'AG101', 2011, 100);
insert into EXAM values ('0001', 'CS118', 2012, 50);
insert into EXAM values ('0001', 'MA3J1', 2012, 250);
insert into EXAM values ('0001', 'AG102', 2012, 100);

insert into EXAM values ('0003', 'CS118', 2012, 90);

COMMIT;

delete from MODULE;
delete from STUDENT;
