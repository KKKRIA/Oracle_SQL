-->>> 비동등결합(NON-EQUI JOIN) : 두개이상의 테이블의 결합조건에 = 연산자가 아닌 다른 연산자를 사용하여 참(TRUE)인 행을 결합하여 검색

--ENP 테이블에 저장된 모든 사원의 사원번호, 사원이름, 급여 검색
SELECT EMPNO, ENAME, SAL FROM EMP;

--SALGRADE 테이블에 저장된 모든 급여등급의 등급번호, 최소급여, 최대급여 검색
SELECT GRADE, LOSAL, HISAL FROM SALGRADE;

--EMP 테이블과 SALGRADE 테이블에서 모든 사원의 사원번호, 사원이름, 급여, 등급번호 검색
--결합조건 : EMP 테이블의 급여(SAL)가 SALGRADE테이블의 최소급여(LOSAL)부터 최대급여(HISAL)범위에 포함되는 행을 결합하여 검색
SELECT EMPNO, ENAME, SAL, GRADE FROM EMP,SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;


-->>> 외부결합(OUTER JOIN) : 결합 조건이 참이 행만 결합하여 검색하는 것이 아니라, 결합조건이 맞지 않는 행도 NULL과 결합하여 검색
--결합 조건식의 테이블에 (+)를 사용하면 결합조건이 맞지 않는 행을 NULL과 결합하여 검색
-- EX) 게시글과 + 댓글을 같이 검색할때,  댓글이 없어도 게시글이 검색될 수 있도록 OUTER JOIN 사용

--EMP 테이블에 저장된 모든 사원의 부서번호를 중복되지 않는 유일한 컬럼값 검색
SELECT DISTINCT DEPTNO FROM EMP;--검색결과 : 10,20,30 --DISTINCT 중복된값 배제

--DEPT 테이블에 저장된 모든 부서의 부서번호, 부서이름, 부서위치 검색
SELECT DEPTNO, DNAME, LOC FROM DEPT; --검색결과 : 10,20,30,40

--EMP 테이블과 DEPT 테이블에서 모든 사원의 사원번호, 사원이름, 급여, 부서이름, 부서위치를 검색
--결합조건 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행만 결합
--40번 부서에 근무하는 사원이 없으므로 40번 부서에 대한 부서이름, 부서위치 미검색 
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;

--사원이 없는 부서도 검색하기 위해 결합 조건식에서 EMP 테이블에 (+)를 붙여 검색하면 EMP테이블의 결합되는 행이 없는 경우 NULL과 결합되어 사원이 없는 부서도 검색 - 외부결합
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP,DEPT WHERE EMP.DEPTNO(+)=DEPT.DEPTNO;


-->>> 자기결합(SELF JOIN) : 하나의 테이블을 서로 다른 별칭을 부여하여 2개 이상의 테이블로 구분하여 행을 결합하여 검색
--검색대상을 사용할 때 테이블을 명확하게 구분하기 위해 테이블 별칭을 사용하여 컬럼값 검색

--EMP 테이블에 저장된 모든 사원의 사원번호, 사원이름, 관리자번호(사원번호) 검색 
SELECT EMPNO,ENAME,MGR FROM EMP; --(MGR : 관리자, 상관을 의미)

--EMP 테이블에 저장된 모든 사원의 사원번호, 사원이름, 관리자번호(사원번호), 관리자이름(사원이름) 검색
--결합조건 : EMP테이블(WORKER)의 관리자 번호(MGR)와 EMP 테이블(MANAGER)의 사원번호(EMPNO)가 같은 행 결합
--EMP 테이블(WORKER)의 관리자번호(MGR)가 NULL인 사원 미검색
SELECT WORKER.EMPNO,WORKER.ENAME WORKER_ENAME,WORKER.MGR,MANAGER.ENAME MANAGER_ENAME 
    FROM EMP WORKER, EMP MANAGER WHERE WORKER.MGR=MANAGER.EMPNO;

--EMP 테이블(WORKER)의 관리자번호(MGR)가 NULL인 사원 검색 - 외부결합 사용
SELECT WORKER.EMPNO,WORKER.ENAME WORKER_ENAME,WORKER.MGR,MANAGER.ENAME MANAGER_ENAME 
    FROM EMP WORKER, EMP MANAGER WHERE WORKER.MGR=MANAGER.EMPNO(+);
    
--EMP 테이블과 DEPT 테이블에서 SALES 부서에 근무하는 사원의 사원번호, 사원이름, 급여, 부서이름, 부서위치 검색
---결합조건 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행 결합
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND DNAME='SALES';

--결합 조건과 행조건을 WHERE에서 같이 사용하므로 유지보수의 불편함이 존재 
--1999년 채택된 표준 SQL(SQL3)에서는 테이블의 결합조건과 행의 조건을 구분하여 사용될 수 있도록 다양한 테이블 결합 관련 기능 제공


-->>> CROSS JOIN : 결합 테이블의 모든 행을 교차 결합하여 검색 - 결합조건 생략
--형식)SELECT 검색대상, 검색대상, ... FROM 테이블명1 CROSS JOIN 테이블명2

--EMP 테이블과 DEPT 테이블에 저장된 모든 사원의 사원번호, 사원이름, 급여, 부서이름, 부서위치를 교차결합하여 검색
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP CROSS JOIN DEPT; --효율적이지 않음


-->>> NATURAL JOIN : 결합 테이블에 같은 이름의 컬럼이 하나만 있는 경우 같은 이름의 컬럼에 저장된 컬럼값이 같은 행을 결합하여 검색 - 결합조건 생략
--형식)SELECT 검색대상, 검색대상, ... FROM 테이블명1 NATURAL JOIN 테이블명2

--EMP 테이블과 DEPT 테이블에 저장된 모든 사원의 사원번호,사원이름,급여,부서이름,부서위치 검색
--결합조건 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행을 결합
--결합 테이블에 같은 이름의 컬럼값을 이용하여 자동으로 행을 결합
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP NATURAL JOIN DEPT;


--EMP 테이블과 DEPT 테이블에 저장된 모든 사원의 사원번호,사원이름,급여,부서번호,부서이름,부서위치 검색
--NATURAL JOIN을 사용할 경우 결합 테이블의 같은 이름의 컬럼을 사용할 때 테이블을 구분하지 않아도 검색 가능
SELECT EMPNO,ENAME,SAL,DEPTNO,DNAME,LOC FROM EMP NATURAL JOIN DEPT;


-->>> JOIN USING : 결합 테이블에 같은 이름의 컬럼이 여러개 있는 경우 같은 이름의 컬럼에 저장된 컬럼값으로 행을 결합하여 검색 - 결합조건 생략
--형식)SELECT 검색대상, 검색대상, ... FROM 테이블명1 JOIN 테이블명2 USING(컬럼명)    --컬럼명은 테이블명1,테이블명2 이름과 같아야함

--EMP 테이블과 DEPT 테이블에 저장된 모든 사원의 사원번호,사원이름,급여,부서번호,부서이름,부서위치 검색
--결합조건 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행을 결합
--결합 테이블에 같은 이름의 컬럼값을 이용하여 자동으로 행을 결합
SELECT EMPNO,ENAME,SAL,DEPTNO,DNAME,LOC FROM EMP JOIN DEPT USING(DEPTNO);


-->>>INNER JOIN : 결합조건이 참(TURE)인 행을 결합하여 검색
--형식) SELECT 검색대상, 검색대상, ... FROM 테이블명1 INNER JOIN 테이블명2 ON 결합조건

--EMP 테이블과 DEPT 테이블에 저장된 모든 사원의 사원번호,사원이름,급여,부서이름,부서위치 검색
--결합조건 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행을 결합
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;
--INNER키워드 생략 가능
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;

--EMP 테이블과 DEPT 테이블에 저장된 모든 사원의 사원번호,사원이름,급여,부서번호, 부서이름,부서위치 검색
--결합 테이블에 같은 이름의 컬럼을 검색할 경우 반드시 테이블을 명확하게 구분하여 표현
SELECT EMPNO,ENAME,SAL,EMP.DEPTNO,DNAME,LOC FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;
SELECT EMPNO,ENAME,SAL,DEPT.DEPTNO,DNAME,LOC FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;

--EMP 테이블과 DEPT 테이블, SALGRADE 테이블에 저장된 모든 사원의 사원번호,사원이름,급여,/부서이름,부서위치,/등급번호 검색
--결합조건-1 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행을 결합
--결합조건-2 : EMP 테이블의 급여(SAL)가 SALGRADE 테이블의 최소급여(LOSAL)부터 최대급여(HISAL) 범위에
--포함되는 행을 결합하여 검색
SELECT EMPNO,ENAME,SAL,DNAME,LOC,GRADE FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO
    JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL;

--EMP 테이블과 DEPT 테이블에서 SALES 부서에 근무하는 사원의 사원번호,사원이름,급여,/부서이름,부서위치 검색
--결합조건 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행 결합
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO WHERE DNAME='SALES';


-->>> OUTER JOIN : 결합 조건이 참이 행만 결합하여 검색하는 것이 아니라, 결합조건이 맞지 않는 행도 NULL과 결합하여 검색
--형식) SELECT 검색대상, 검색대상, ... FROM 테이블명1 (LEFT|RIGHT|FULL) OUTER JOIN 테이블명2 ON 결합조건
--LEFT OUTER JOIN : 왼쪽 테이블의 모든 행을 검색하고 결합조건이 맞는 오른쪽 테이블의 행은 NULL로 결합하여 검색
--RIGHT OUTER JOIN : 오른쪽 테이블의 모든 행을 검색하고 결합조건이 맞는 왼쪽 테이블의 행은 NULL로 결합하여 검색 
--FULL OUTER JOIN : 양쪽 테이블의 모든 행을 검색하고 결합조건이 맞는 양쪽 테이블의 행은 NULL로 결합하여 검색 

--EMP 테이블과 DEPT 테이블에 저장된 모든 사원의 사원번호,사원이름,급여, 부서이름,부서위치 검색
--결합조건 : EMP 테이블의 부서번호(DEPTNO)와 DEPT 테이블의 부서번호(DEPTNO)가 같은 행을 결합
--결합조건이 맞지 않는 행은 미검색 - 40번 부서의 부서이름, 부서위치 미검색
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;

--결합 조건이 맞지 않는 행을 NULL과 결합하여 검색 - OUTER 키워드 생략가능
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP LEFT JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP RIGHT JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;
SELECT EMPNO,ENAME,SAL,DNAME,LOC FROM EMP FULL JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;



--08.다중테이블 PDF(15P -실습문제)-------------------------------------------------------------------------------
--문제1. 
--부서 테이블과 사원 테이블에서 사번,사원명,/부서코드,부서명을 검색하시오.(사원명으로 오름차순 정렬할 것)  
-->부서코드는 EMP에도 있고 DEPT에도 있기때문에 같은이름이라서 [테이블명.컬럼명]으로 구분
SELECT EMPNO,ENAME,EMP.DEPTNO,DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO ORDER BY ENAME;
SELECT EMPNO,ENAME,DEPT.DEPTNO,DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO ORDER BY ENAME;





    
--문제2.
--부서 테이블과 사원 테이블에서 사번,사원명,급여,/부서명 검색하시오.
--단,급여가 2000 이상인 사원에 대하여 사번을 기준으로 오름차순 정렬할 것
SELECT EMPNO,ENAME,SAL,DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO 
    WHERE SAL>=2000 ORDER BY EMPNO;

--문제3.
--부서 테이블과 사원 테이블에서 사번,사원명,업무,급여,/부서명을 검색하시오. 
--단, 업무가 MANAGER 이며 (그리고) 급여가 2500 이상인 사원에 대하여 사번을 기준으로 오름차순 정렬할 것 
SELECT EMPNO,ENAME,JOB,SAL,DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO 
    WHERE JOB='MANAGER' AND SAL>=2500 ORDER BY EMPNO;

--문제4. 
--사원 테이블과 급여등급 테이블에서 사번,사원명,급여,/등급을 검색하시오. 
--단, 등급은 /급여가 하한값과 상한값 범위에 포함되고,/ 등급이 4이며 급여를 기준으로 내림차순 정렬할 것  
SELECT EMPNO,ENAME,SAL,GRADE FROM EMP JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL
    WHERE GRADE=4 ORDER BY SAL DESC;

--문제5. 
--부서 테이블,/ 사원 테이블, /급여등급 테이블/에서 사번,사원명,부서명,급여,등급을 검색하시오. 
--단, 등급은 /급여가 하한값과 상한값 범위에 포함/되며 /등급을 기준으로 내림차순 정렬/할 것 
SELECT EMPNO,ENAME,DNAME,SAL,GRADE FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO 
    JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL ORDER BY GRADE DESC;

--문제6. 
--사원 테이블에서 사원명과 해당 사원의 관리자명을 검색하시오.
SELECT W.ENAME "사원명", M.ENAME "관리자명" FROM EMP W JOIN EMP M ON W.ENAME = M.ENAME;
-- 하나를 두개의 테이블로 결합시켜 

--문제7. 
--사원 테이블에서 사원명과 해당 사원의 관리자명,해당 사원의 관리자의 관리자명을 검색하시오.
SELECT W.ENAME "사원명",M.ENAME "관리자명",MM.ENAME "관리자의 관리자명" 
    FROM EMP W JOIN EMP M ON W.MGR=M.EMPNO JOIN EMP MM ON M.MGR=MM.EMPNO;

--문제8. 7번 결과에서 상위 관리자가 없는 모든 사원의 이름도 사원명에 출력되도록 수정하시오. 
SELECT W.ENAME "사원명",M.ENAME "관리자명",MM.ENAME "관리자의 관리자명" 
    FROM EMP W LEFT JOIN EMP M ON W.MGR=M.EMPNO LEFT JOIN EMP MM ON M.MGR=MM.EMPNO;

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------



-->>> 서브쿼리(SUBQUERY) : SQL 명령에 포함되어 실행되는 SELECT 명령
--다수의 SQL명령으로 얻을 수 있는 결과를 하나의 SQL 명령으로 얻기 위해 사용하는 기능

--SELECT 명령(MAINQUERY)에 포함되어 실행되는 SELECT 명령(SUBQUERY)
--서브쿼리의 명령을 먼저 실행하고 검색되는 결과값을 사용하여 메인쿼리의 명령 실행하여 검색
--SELECT 명령의 서브쿼리는 FROM, WHERE, HAVIG에서 () 안에 작성하여 실행

--EMP 테이블에서 사원이름이 SCOTT인 사원보다 많은 급여를 받은 사원의 사원번호, 사원이름, 급여 검색
--SELECT명령을 2번 사용하여 원하는 결과 검색
SELECT SAL FROM EMP WHERE ENAME='SCOTT'; --검색결과 3000
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>3000;

--서브쿼리를 사용하여 하나의 SELECT 명령으로 원하는 결과 검색 가능
--WHERE 조건식의 비교값 대신 서브쿼리의 검색 결과값을 제공받아 검색
--조건식의 비교대상(컬럼)과 같은 자료형의 값이 하나만 검색되도록 서브쿼리 작성
--서브쿼리로 단일행(SINGLE-ROW)의 단일컬럼 (SINGLE-COLUMN)에 대한 값이 검색
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='SCOTT');

--EMP 테이블에서 사원번호가 7844인 사원과 /같은 업무를 하는 사원의/ 사원번호,사원이름, 업무, 급여 검색 (7844번인 사원은 포함안됨!!)
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNO=7844) AND EMPNO<>7844;

--EMP 테이블에서 사원번호가 7521인 사원과 /같은 업무를 하는 사원중 /사원번호가 7844인 사원보다 많은 급여를 받는 사원/의 사원번호, 사원이름, 업무, 급여검색
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNO=7521)
   AND SAL>(SELECT SAL FROM EMP WHERE EMPNO=7844);

--EMP 테이블에서 /SALES 부서에 근무하는 사원의 사원번호, 사원이름, 업무, 급여/ 검색
--부서이름은 DEPT 테이블에 저장되어 있으므로 테이블 결합을 사용하여 검색
SELECT EMPNO,ENAME,JOB,SAL FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO WHERE DNAME='SALES';

--테이블 결합 대신 서브쿼리를 사용하여 검색가능
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');

--EMP 테이블에서 저장된 모든 사원 중 /가장 적은 급여를 받는 사원/의 사원번호, 사원이름, 업무, 급여 검색
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP);

--EMP 테이블에서 /SALSE 부서에 근무하는 사원 중/ /가장 적은 급여를 받는 사원/의 사원번호, 사원이름, 업무, 급여 검색
--오라클만 서브쿼리 안에 서브쿼리를 사용하여 검색 가능
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES'));

--EMP 테이블에서 /부서별 평균 급여/ 중 /가장 많은 평균 급여/를 받는 부서의 부서번호, 평균급여 검색
--HAVING의 그룹조건식에서 비교값대신 서브쿼리의 결과값을 사용하여 검색
SELECT DEPTNO,CEIL(AVG(SAL)) FROM EMP GROUP BY DEPTNO 
    HAVING AVG(SAL)=(SELECT MAX(AVG(SAL)) FROM EMP GROUP BY DEPTNO);
    
    
    
--EMP 테이블에서 부서별로 가장 적은 급여를 받는 사원의 사원번호, 사원이름, 급여, 부서번호 검색
--서브쿼리에 검색결과가 다중행(MULTI-ROW SUBQUERY)인 경우_ = 연산자를 사용하여 컬럼값을 비교할 경우 에러발생
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO);

--서브쿼리의 검색결과가 다중행인 경우, =연산자 대신 IN키워드를 사용하여 컬럼값 검색 가능 (IN :여러개들중 하나)
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL IN (SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO);


--서브쿼리의 검색결과가 다중행인 경우 > 또는 < 연산자로 컬럼값을 비교하기 위해 서브쿼리 앞에 ANY 또는 ALL 키워드를 사용하여 검색

--EMP 테이블에서 부서번호가 10인 부서에 근무하는 어떠한 사원보다 급여가 적은 사원의 사원번호,사원이름,급여,부서번호 검색
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL<ANY(SELECT SAL FROM EMP WHERE DEPTNO=10) AND DEPTNO<>10;

--EMP 테이블에서 부서번호가 10인 부서에 근무하는 모든 사원보다 급여가 적은 사원의 사원번호,사원이름,급여,부서번호 검색
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL<ALL(SELECT SAL FROM EMP WHERE DEPTNO=10);

--EMP 테이블에서 부서번호가 20인 부서에 근무하는 어떠한 사원보다 급여가 많은 사원의 사원번호,사원이름,급여,부서번호 검색
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL>ANY(SELECT SAL FROM EMP WHERE DEPTNO=20) AND DEPTNO<>20;

--EMP 테이블에서 부서번호가 20인 부서에 근무하는 모든 사원보다 급여가 많은 사원의 사원번호,사원이름,급여,부서번호 검색
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL>ALL(SELECT SAL FROM EMP WHERE DEPTNO=20);



--다중행 서브쿼리의 ANY 또는 ALL 키워드 대신 단일행 서브쿼리에 MIN 또는 MAX 함수를 사용하는 것을 권장

--EMP 테이블에서 부서번호가 10인 부서에 근무하는 어떠한 사원보다 급여가 적은 사원의 사원번호,사원이름,급여,부서번호 검색
--컬럼명<ANY(다중행 서브쿼리) 대신 컬럼명<(단일행 서브쿼리 - MAX 함수) 사용
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=10) AND DEPTNO<>10;

--EMP 테이블에서 부서번호가 10인 부서에 근무하는 모든 사원보다 급여가 적은 사원의 사원번호,사원이름,급여,부서번호 검색
--컬럼명<ALL(다중행 서브쿼리) 대신 컬럼명<(단일행 서브쿼리 - MIN 함수) 사용
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL<(SELECT MIN(SAL) FROM EMP WHERE DEPTNO=10);

--EMP 테이블에서 부서번호가 20인 부서에 근무하는 어떠한 사원보다 급여가 많은 사원의 사원번호,사원이름,급여,부서번호 검색
--컬럼명>ANY(다중행 서브쿼리) 대신 컬럼명>(단일행 서브쿼리 - MIN 함수) 사용
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL>(SELECT MIN(SAL) FROM EMP WHERE DEPTNO=20) AND DEPTNO<>20;

--EMP 테이블에서 부서번호가 20인 부서에 근무하는 모든 사원보다 급여가 많은 사원의 사원번호,사원이름,급여,부서번호 검색
--컬럼명>ALL(다중행 서브쿼리) 대신 컬럼명>(단일행 서브쿼리 - MAX 함수) 사용
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20);



--EMP 테이블에서 사원이름이 ALLEN인 사원과 관리자가 같으며 업무를 같은 사원의 사원번호,사원이름,관리자번호,업무,급여 검색
SELECT EMPNO,ENAME,MGR,JOB,SAL FROM EMP WHERE MGR=(SELECT MGR FROM EMP WHERE ENAME='ALLEN')
    AND JOB=(SELECT JOB FROM EMP WHERE ENAME='ALLEN') AND ENAME<>'ALLEN';

--서브쿼리의 검색대상이 여러 개(MULTI-COLUMN SUBQUERY)인 경우 비교 컬럼을 () 안에 ,로 나열하여 검색 가능     
SELECT EMPNO,ENAME,MGR,JOB,SAL FROM EMP 
    WHERE (MGR,JOB)=(SELECT MGR,JOB FROM EMP WHERE ENAME='ALLEN') AND ENAME<>'ALLEN';
    
    
    
--09.서브쿼리 PDF(8P -실습문제)-------------------------------------------------------------------------------
--문제1.
--사원 테이블에서 BLAKE 보다 급여가 많은 사원들의 사번,이름,급여를 검색하시오.
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='BLAKE');

--문제2.
--사원 테이블에서 MILLER 보다 늦게 입사한 사원의 사번,이름,입사일을 검색하시오.
SELECT EMPNO,ENAME,HIREDATE FROM EMP WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');

--문제3.
--사원 테이블에서 사원 전체 평균 급여보다 급여가 많은 사원들의 사번,이름,급여를 검색하시오.
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>(SELECT AVG(SAL)FROM EMP);

--문제4.
--사원 테이블에서 CLARK와 같은 부서이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원들의 사번,이름,급여를 검색하시오.
SELECT EMPNO,ENAME,SAL FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='CLARK')
    AND SAL>(SELECT SAL FROM EMP WHERE EMPNO='7698' );

--문제5.
--사원 테이블에서 부서별 최대 급여를 받는 사원들의 사번,이름,부서코드,급여를 검색하시오.
SELECT EMPNO,ENAME,DEPTNO,SAL FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
SELECT EMPNO,ENAME,DEPTNO,SAL FROM EMP E1 WHERE SAL IN 
    (SELECT MAX(SAL) FROM EMP E2 WHERE E1.DEPTNO=E2.DEPTNO GROUP BY DEPTNO);



-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

