-- ��ũ��Ʈ ���� ó��

-- ��ũ��Ʈ���� �ۼ��� SQL ����� ���ӵ� ����Ŭ ������ �����Ͽ� �����ϴ� ��� 
-- [CTRL]+[ENTER] : Ŀ�� ��ġ�� SQL ����� �����Ͽ� ����  (���ǰ���� ���)
-- [F5] : ��ũ��Ʈ�� �ۼ��� ��� SQL����� �����Ͽ� ���� (��ũ��Ʈ�� ���)
-- ������ ����(�巡��)�Ͽ� [CTRL]+[ENTER] �Ǵ� [F5]�� ����ϸ� ���� ������ SQL ����� �����Ͽ� ����
-- ��ũ��Ʈ�� �ۼ��Ǿ� �����  SQL ����� ����� [��ũ��Ʈ ���]�Ǵ� [���ǰ��] �ǿ� ���

--SQL ����� ��ҹ��ڸ� �������� ������ �ϳ��� ������� ó���ǵ���  ; ��ȣ ���
SHOW USER; --���� ������ ������ ����� ������ �˻��ϱ� ���� ���

--���̺�(TABLE) : ����Ÿ���̽����� ����Ÿ(��)�� �����ϱ� ���� �⺻ ��ü
--���� ���� �����(SCOTT)�� ���� ������ ��Ű���� �����ϴ� ���̺� ��� Ȯ��
SELECT TABLE_NAME FROM TABS; --����
SELECT * FROM TAB; --�����ϰ� �Ѱ�

--���̺��� �Ӽ� ���� Ȯ�� : �÷���� �ڷ��� - ���̺� �Ӽ�
--����)DESC ���̺��
DESC EMP;  --EMP ���̺� : ��������� �����ϱ� ���� ���̺�
DESC DEPT; --DEPT ���̺� : �μ������� �����ϱ� ���� ���̺�

--DQL(DATA QUERY LANGUAGE)����Ÿ ���Ǿ�- ���̺� ����� ���� �˻��ϱ� ���� SQL ���
--SELECT : �ϳ� �̻��� ���̺��� ���� �˻��ϱ� ���� ��� �ڡڡ�
--����)SELECT �˻����,�˻����,... FROM ���̺��
--�ϳ��� ���̺� ����� ��� ���� �˻��ϱ� ���� SELECT ���
--�˻���� : *(��� �ķ���) - �ٸ� �˻����� ���ÿ� ��� �Ұ���, �÷�, �����, �Լ� ��
SELECT * FROM EMP; --��� EMP �˻��ǵ���
SELECT EMPNO,ENAME,SAL FROM EMP; -- EMP���� EMPNO,ENAME,SAL �� �˻��ǵ���

--COLUMN ALIAS : �˻���� ��Ī(�ӽ� �÷���)�� �ο��ϴ� ���
--�˻������ ��Ȯ�ϰ� �����ϱ� ���� COLUMN ALIAS ��� �ڡڡ�
--����) SELECT �˻���� [AS] ��Ī,�˻���� [AS] ��Ī,... FROM ���̺��
SELECT EMPNO,ENAME,DEPTNO FROM EMP;
SELECT EMPNO AS NO,ENAME AS NAME,DEPTNO AS DNO FROM EMP;
--�÷��� ��Ī�� �����ϱ� ���� AS Ű���� ���� ����
SELECT EMPNO NO,ENAME NAME,DEPTNO DNO FROM EMP; --AS ��������
SELECT EMPNO �����ȣ,ENAME ����̸�,DEPTNO �μ���ȣ FROM EMP; -- �ѱ۵� ���������� ���X

--�˻�������� �÷����� �̿��� ����� ����� ����
SELECT EMPNO, ENAME, SAL*12 FROM EMP;
SELECT EMPNO, ENAME, SAL*12 ANNUAL FROM EMP;

--SQL ����� �����(Ű����)�� ����� ���� ��Ī(�ĺ���)�� �ܾ�� ����
--�ĺ���(���̺��, �÷���, ��Ī ��)�� ������ũ ǥ��� �̿�(�ܾ�� �ܾ _�� �����Ͽ� ǥ��)
SELECT EMPNO, ENAME, SAL*12 ANNUAL_SALARY FROM EMP;

SELECT EMPNO �����ȣ,ENAME ����̸�, SAL*12 ���� FROM EMP;
--�˻������ ��Ī���� ���� �Ǵ� Ư������ ��� �Ұ���
SELECT EMPNO ��� ��ȣ,ENAME ����̸�, SAL*12 ^����^ FROM EMP; --�����߻�
--�˻������ ��Ī�� " " ��ȣ �ȿ� ǥ���ϸ� ��� ������ ��Ī ǥ�� ����
--" "��ȣ�� ���Ұ����� �ܾ �ĺ��ڷ� �����ϱ� ���� ����ϴ� Ư������
SELECT EMPNO "��� ��ȣ",ENAME "����̸�", SAL*12 "^����^" FROM EMP;

--�˻������ , ��ȣ�� ����Ͽ� ���� �ۼ� ����
SELECT ENAME, JOB FROM EMP;

--�˻������ || ��ȣ�� ����Ͽ� �ڹ��ڰ����� ���ա��Ͽ� �˻� 
SELECT ENAME||JOB FROM EMP;

--SQL���� ���ڰ��� '' ��ȣ�� ����Ͽ� ǥ��
SELECT ENAME|| '���� ������ ' ||JOB|| '�Դϴ�' FROM EMP;

--EMP ���̺� ����� ��� ����� ���� �˻� - �ߺ� �÷��� �˻�
SELECT JOB FROM EMP;

--EMP ���̺� ����� ��� ����� ���� �˻� - �ߺ� �÷����� ������ ������ �ϳ��� �÷����� �˻�
--DISTINCT : �˻������ �ߺ����� �����ϰ� ������ �ϳ��� �÷����� �˻��ϴ� ����� �����ϴ� Ű����
--����) SELECT DISTINCT �˻���� FROM ���̺��
SELECT DISTINCT JOB FROM EMP;

--����Ŭ�� DEPTNO Ű���忡 �˻������ ������ �����Ͽ� �ۼ� ����
SELECT DISTINCT JOB, DEPTNO FROM EMP;

--WHERE : ���ǽ��� ����Ͽ� ������ ��(TRUE)�� �ุ �˻� ��
--����) SELECT �˻����,�˻����... FROM ���̺�� WHERE ���ǽ�
--���ǽ��� �Ϲ������� �÷����� ���ϴ� �����

--���̺� ����� ��� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP;

--EMP ���̺��� �����ȣ�� 7698�� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE EMPNO=7698; -- FROM EMP ���� EMPNO�� 7698�� ����� EMPNO,ENAME,JOB,SAL ���� �˻����ּ���

--EMP ���̺��� ����̸��� KING�� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME='KING'; -- ���ڰ��� �̱������̼�'' �� ǥ��
--SQL�� ��ҹ��ڸ� �������� ������ ���ڰ��� ��ҹ��ڸ� ����
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME='King';

--EMP ���̺��� �Ի����� 1981�� 6�� 9���� ����� �����ȣ, ����̸�, ����, �޿�, �Ի��� �˻�
--��¥���� �̱������̼� ''�ȿ� [RR/MM/DD] ������ �������� ǥ���Ͽ� ��밡��- ��¥���� �⺻ ���� : [RR/MM/DD]
SELECT EMPNO,ENAME,JOB,SAL,HIREDATE FROM EMP WHERE HIREDATE='81/06/09';
--��¥���� �̱������̼� ''�ȿ� [YYYY/MM/DD] ������ �������� ǥ���Ͽ� ��밡��
SELECT EMPNO,ENAME,JOB,SAL,HIREDATE FROM EMP WHERE HIREDATE='1981-06-09';

--EMP���̺��� ������ SALESMAN�� �ƴ� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB<>'SALESMAN'; --�����ʴ�(�۴�,ũ�� ���� ���)
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB!='SALESMAN';

--EMP ���̺��� �޿��� 2000�̻��� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL>=2000; --���ڰ� �񱳰���

--EMP ���̺��� ����̸��� A,B,C,�� ���۵Ǵ� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME<'D'; --���ڰ��� �񱳰���

--EMP ���̺��� 1981�� 5�� 1�� ���� �Ի��� ����� �����ȣ, ����̸�, ����, �޿� �Ի��� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE HIREDATE<'81/05/01'; --��¥���� �񱳰���

--EMP ���̺��� ������ SALESMAN�� ��� �� �޿��� 1500 �̻��� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB='SALESMAN' AND SAL>=1500;

--EMP ���̺��� �μ���ȣ�� 10�̰ų� ������ MANAGER�� ����� �����ȣ, ����̸�, ����, �޿�, �μ���ȣ �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE DEPTNO=10 OR JOB='MANAGER';

--EMP ���̺��� �޿��� 1000~3000 ������ ���ԵǴ� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL>=1000 AND SAL<=3000;

--������ ǥ���� ���ǽ��� �̿��Ͽ� �÷����� ���������� ū�� ������ ���Ե� ��� �ุ �˻�����
--����)�÷��� BETWEEN ������ AND ū��
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL BETWEEN 1000 AND 3000; --1000,3000�Ѵ� ���� --AND ��Ż��

--EMP ���̺��� ������ ANALYST�̰ų� SALESMAN�� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB='ANALYST' OR JOB='SALESMAN';

--������ ǥ���� ���ǽ��� �̿��Ͽ� �÷����� ������ ������ �ϳ��� �����ص� ���� �˻��� �ǵ���
--����) �÷��� IN ( ��, ��)
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB IN ('ANALYST', 'SALESMAN');  -- OR ��� ���

--EMP ���̺��� ����̸��� ALLEN�� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME='ALLEN';

--EMP ���̺��� ����̸��� A�ڷ� ���۵Ǵ� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME>='A' AND ENAME<'B';
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME BETWEEN 'A' AND 'B' AND ENAME<>'B';

--�˻� ���ڸ� �̿��Ͽ� �÷��� �˻� ����
--�˻����� : [%] - ��ü , [_]- �����ϳ�
--�˻����ڸ� = �����ڷ� �÷����� ���� ��� �˻����ڰ� �ƴ� �Ϲݹ��ڷ� �˻�
--�˻����ڸ� �̿��Ͽ� �÷����� �� �˻��� ��� [=]������ ��� LIKE Ű���� ���
--����)�÷��� LIKE '�˻����ڸ� ������ �񱳰�'
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME='A%'; -- =���� ''�ȿ� �񱳰��� �ƴ� ���ڷ� �ν��ع���, �˻�����
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME LIKE 'A%'; --A�� �����ϴ� ��� ���ڿ� ��ȯ


--�˻����ڸ� ������� �ʾƵ�[=]������ ��� LIKE Ű���� ��� ���� (�׷��� �˻����ڷ� �̿��Ҷ� ����ϱ�)
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME LIKE 'ALLEN';

--EMP ���̺��� ����̸��� A�� ���ԵǴ� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME LIKE '%A%';

--EMP ���̺��� ����̸��� �ι�° ���ڰ� L�� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME LIKE '_L%'; --3��° ���ڴ� ����� �ΰ� __L%;

--EMP ���̺� ���ο� ������� ����
INSERT INTO EMP VALUES(9000,'M_BEER','CLERK','7788', '81/12/12', 1300, NULL, 10);
SELECT * FROM EMP;
COMMIT;

--EMP ���̺��� ����̸��� [_]���ڰ� ���Ե� ����� �����ȣ, ����̸�, ����, �޿� �˻�
--�÷����� LIKE Ű����� ���� ���[%]���ڿ� [_]���ڴ� �˻����ڷ� ó���Ǿ� �˻� - �˻�����
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME LIKE '%_%';

--ESCAPEŰ����� ������ ���ڸ� ����Ͽ� ���ڰ����� ǥ�� �Ұ����� ���ڸ� ȸ�ǹ��� (ESCAPE CHARACTER)�� ǥ���Ͽ� �Ϲݹ��ڷ� ó���Ͽ� �˻�����
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE ENAME LIKE '%\_%' ESCAPE '\';

--EMP ���̺��� �����ȣ�� 9000�� �������(��) ����
DELETE FROM EMP WHERE EMPNO=9000;
SELECT * FROM EMP;
COMMIT;

--EMP ���̺��� ������ MANNGER�� �ƴ� ����� �����ȣ, ����̸�, ����, �޿� �˻�
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB<>'MANNGER';

--NOT Ű���带 ����Ͽ� ���ǽ��� ����� ��(TRUE)�� �ƴ� ����(FALSE)�� �ุ �˻�
--����)NOT (���ǽ�)
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE NOT(JOB='MANNGER');

--EMP ���̺� ����� ��� ����� �����ȣ, ����̸�, ����, �޿�, ������ �˻�
--NULL: ���� �������� �ʴ� ���� ǥ���ϱ� ���� Ű����
SELECT EMPNO,ENAME,JOB,SAL,COMM FROM EMP;

--EMP ���̺��� �������� �������� �ʴ� ����� �����ȣ, ����̸�, ����, �޿�, ������ �˻�
--NULL ���� �ƴϹǷ� �� �Ұ��� - �˻�����
SELECT EMPNO,ENAME,JOB,SAL,COMM FROM EMP WHERE COMM=NULL; --�˻�����

--IS Ű���带 ����Ͽ� NULL�� �����ϴ� ���ǽ� ��� 
--����)�÷��� IS NULL �Ǵ� �÷��� IS NOT NULL
SELECT EMPNO,ENAME,JOB,SAL,COMM FROM EMP WHERE COMM IS NULL;

--EMP ���̺��� �������� �����ϴ� ����� �����ȣ,����̸�,����,�޿�,������ �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM FROM EMP WHERE COMM IS NOT NULL;

--ORDER BY : �÷����� ���Ͽ� ���� ���ĵǵ��� �˻��ϴ� ����� ����
--����)SELECT �˻����, �˻����,... FROM ���̺�� [WHERE ���ǽ�]
--    ORDER BY {�÷���|�����|��Ī|INDEX}{ASC|DESC},{�÷���|�����|��Ī|INDEX}{ASC|DESC},...
--ASC : �������� ����, DESC: �������� ����(�ڷ� ������ �۾����°�)      
--���� �÷����� ���� ��� �ٸ� �÷����� ���Ͽ� ���ĵǵ��� ������ �����Ͽ� �ۼ� ����

--EMP ���̺� ����� ��� ����� �����ȣ, ����̸�, ����, �޿�, �μ���ȣ �˻�
--�⺻������ ���̺� ���� ���Ե� ������� �˻�
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP;

--EMP ���̺� ����� ��� ����� �����ȣ,����̸�,����,�޿�,�μ���ȣ�� �μ���ȣ�� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP ORDER BY DEPTNO ASC;
--�������� ������ ��� ASC Ű���� ���� ����
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP ORDER BY DEPTNO; 

--EMP ���̺� ����� ��� ����� �����ȣ, ����̸�, ����, �޿�, �μ���ȣ�� �޿��� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP ORDER BY SAL DESC;

--EMP ���̺� ����� ��� ����� �����ȣ, ����̸�, ����, �޿�, �μ���ȣ�� ����̸����� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP ORDER BY ENAME;

--EMP ���̺� ����� ��� ����� �����ȣ, ����̸�, ����, �޿�, �Ի���, �μ���ȣ�� �Ի��Ϸ� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,HIREDATE,DEPTNO FROM EMP ORDER BY HIREDATE DESC;

--EMP ���̺� ����� ��� ����� �����ȣ, ����̸�, ����(�޿�*12)�� �������� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,SAL*12 ANNUAL FROM EMP ORDER BY SAL*12 DESC; --�÷��� ��� ����� ��� ����(������� ����Ͽ� ����)
SELECT EMPNO,ENAME,SAL*12 ANNUAL FROM EMP ORDER BY ANNUAL DESC; --�÷��� ��� ��Ī ��� ����(������� ����Ͽ� ����)
--SELECT ����� �˻���󿡴� �ڵ����� ÷��(INDEX : ��ġ�� ǥ���ϴ� ���ڰ�)�� �ο� - COLUMN INDEX
--����Ŭ���� ÷�ڴ� 1���� 1�� �����Ǵ� ���ڰ����� ǥ��
SELECT EMPNO,ENAME,SAL*12 ANUUAL FROM EMP ORDER BY 3 DESC; --�÷�÷�ڸ� ����Ͽ� ����

--EMP ���̺� ����� ��� ����� �����ȣ, ����̸�, ����, �޿�, �μ���ȣ�� �μ���ȣ�� �������� �����ϰ�
--�μ���ȣ�� ���� ����� �޿��� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP ORDER BY DEPTNO ASC, SAL DESC;
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP ORDER BY DEPTNO, SAL DESC;

--EMP ���̺��� �޿��� 3000�̻��� ����� �����ȣ, ����̸�, ����, �޿�, �μ���ȣ�� �μ���ȣ�� �μ���ȣ�� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP WHERE SAL>=3000 ORDER BY DEPTNO;


-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--�˻���� : EMP ���̺��� �����ȣ, ����̸�, ����, �޿�, ������, �Ի���,�μ���ȣ
--����1. ����̸��� SCOTT �� ��� �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE ENAME='SCOTT';
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE ENAME LIKE'SCOTT';
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE ENAME=USER; --USER : ���� ���� ������� �̸��� ǥ���ϱ� ���� Ű����

--����2. �޿��� 1500������ ����� �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE SAL<=1500;

--����3. 1981�⿡ �Ի��� ����� �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE HIREDATE>='81/01/01' AND HIREDATE<='81/12/31';
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE HIREDATE BETWEEN '81/01/01' AND '81/12/31';
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE HIREDATE LIKE '81%'; --(����X)
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE HIREDATE LIKE '81/__/__'; --(����X)

--����4. ������ SALESMAN �Ǵ� MANAGER�� ����� �޿��� 1500�̻��� ��� �˻�
--X-- SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE JOB='SALESMAN'OR JOB='MANAGER' AND SAL>=1500; --OR ���� AND �� ���� ���
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE (JOB='SALESMAN'OR JOB='MANAGER') AND SAL>=1500;
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE JOB IN ('SALESMAN','MANAGER') AND SAL>=1500; --(����)

--����5. �μ���ȣ�� 10�� ����� �޿��� 1000~3000 ������ ��� �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE DEPTNO=10 AND SAL>=1000 AND SAL<=3000;
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE DEPTNO=10 AND SAL BETWEEN 1000 AND 3000;

--����6. �μ���ȣ�� 30�� ����� �������� �����ϴ� ��� �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL;

--����7. ��� ����� ������ �������� �����Ͽ� �˻��ϰ� ���� ������ ����� �޿��� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP ORDER BY JOB ASC,SAL DESC;
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP ORDER BY JOB ,SAL DESC; --ASC��������

--����8. ������ SALESMAN�� ����� �޿��� �������� �����Ͽ� �˻�
SELECT EMPNO,ENAME,JOB,SAL,COMM,HIREDATE,DEPTNO FROM EMP WHERE JOB ='SALESMAN' ORDER BY SAL DESC;

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------



--�Լ�(FUNCTION) : �Ű������� ���޹��� ���� �����Ͽ� ó�� ������� ��ȯ�ϴ� ����� ����
--�����Լ� : �ϳ��� ���� ���޹޾� �����Ͽ� ������� ��ȯ�ϴ� �Լ� - �����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, �Ϲ��Լ�
--�׷��Լ� : �ټ��� ���� ���޹޾� �����Ͽ� ������� ��ȯ�ϴ� �Լ�

-- �� �����Լ� �� : �Ű������� ���ڰ��� ���޹޾� �����Ͽ� ������� ��ȯ�ϴ� �Լ�

--UPPER(���ڰ�) : ���ڰ��� ���޹޾� �빮�ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�
--LOWER(���ڰ�) : ���ڰ��� ���޹޾� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�
SELECT ENAME, UPPER(ENAME),LOWER(ENAME) FROM EMP;

--EMP ���̺��� ����̸��� SMITH�� ����� �����ȣ, ����̸�, �޿� �˻�
SELECT EMPNO,ENAME,SAL FROM EMP WHERE ENAME='SMITH';
--���ڰ��� ��ҹ��ڸ� �����Ͽ� ��
SELECT EMPNO,ENAME,SAL FROM EMP WHERE ENAME='smith'; --�˻�����
--UPPER �Լ� �Ǵ� LOWER �Լ��� ����Ͽ� ��ҹ��ڸ� �������� �ʰ� ���� ��� ���
SELECT EMPNO,ENAME,SAL FROM EMP WHERE UPPER(ENAME)= UPPER('smith');
SELECT EMPNO,ENAME,SAL FROM EMP WHERE UPPER(ENAME)= UPPER('SMITH');

--INITCAP(���ڰ�) : ���ڰ��� ���޹޾� ù��° ���ڸ� �빮�ڷ� ��ȯ�ϰ� ������ ���ڴ� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�
SELECT ENAME, INITCAP(ENAME) FROM EMP;

--CONCAT(���ڰ�, ���ڰ�) : �� ���� ���ڰ��� ���޹޾� �����Ͽ� ��ȯ�ϴ� �Լ� -  || ��ȣ�� ����ϴ� �Ͱ� ������ ��� ����
SELECT ENAME,JOB,CONCAT(ENAME,JOB), ENAME||JOB FROM EMP;

--SUBSTR(���ڰ�, ������ġ, ����) : ���ڰ��� ���޹޾� ������ġ(INDEX)���� ������ŭ�� ���ڵ��� �и��Ͽ� ��ȯ�ϴ� �Լ�
SELECT EMPNO, ENAME,JOB, SUBSTR(JOB,6,3) FROM EMP WHERE EMPNO=7499; 

--LENGTH(���ڰ�) : ���ڰ��� ���޹޾� ���� ������ ��ȯ�ϴ� �Լ�
SELECT EMPNO, ENAME,JOB,LENGTH(JOB)FROM EMP WHERE EMPNO=7499; 

--INSTR(���ڰ�, �˻����ڰ�,����÷��, �˻���ġ) : ���ڰ��� ���޹޾� �˻����ڰ��� ������ġ(÷��)���� �˻��Ͽ� ���ϴ� ��ġ�� ���ڰ��� ����÷�ڸ� ��ȯ�ϴ� �Լ�
SELECT EMPNO, ENAME,JOB,INSTR(JOB,'A',1,2)FROM EMP WHERE EMPNO=7499; --1��°�μ� �����ؼ� 2��° A��
SELECT EMPNO, ENAME,JOB,INSTR(JOB,'X',1,2)FROM EMP WHERE EMPNO=7499; -- �˻����ڰ��� ���� ��� 0�� ��ȯ


--LPAD(���ڰ�, �ڸ��� ä�﹮��) : ���ڰ��� ���޹޾� �ڸ����� ���̸�ŭ �����ʺ��� ä��� ���� ���� �ڸ����� ä�﹮�ڷ� ä�� ���ڰ��� ��ȯ�ϴ� �Լ�
--RPAD(���ڰ�, �ڸ��� ä�﹮��) : ���ڰ��� ���޹޾� �ڸ����� ���̸�ŭ ���ʺ��� ä��� ������ ���� �ڸ����� ä�﹮�ڷ� ä�� ���ڰ��� ��ȯ�ϴ� �Լ�
SELECT EMPNO, ENAME,SAL,LPAD(SAL,8,'*'),RPAD(SAL,8,'*') FROM EMP;

--TRIM((LEADING|TRAILING) ���Ź��� FROM ���ڰ�) : ���ڰ��� ���޹޾� ��(LEADNG) �Ǵ� ��(TRAILING)�� �����ϴ� ���Ź��ڵ��� �����ϰ� ��ȯ�ϴ� �Լ�
SELECT EMPNO, ENAME,TRIM(LEADING 'S' FROM JOB), TRIM(TRAILING 'N' FROM JOB) FROM EMP WHERE EMPNO=7499;

--REPLACE(���ڰ�, �˻����ڰ�, ġȯ���ڰ�) : ���ڰ��� ���޹޾� �˻����ڰ��� ã�� ġȯ���ڰ����� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�
SELECT EMPNO, ENAME, JOB, REPLACE(JOB,'MAN','PERSON') FROM EMP WHERE EMPNO=7499;
