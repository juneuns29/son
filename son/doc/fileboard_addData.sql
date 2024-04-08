SELECT
    COUNT(*)
FROM
    fileinfo
WHERE
    fbno = 1001
    AND isshow = 'Y'
;

SELECT
    rno, id, name
FROM
    (
        SELECT
            ROWNUM rno, ID, NAME
        FROM
            (
                SELECT
                    MNO, ID, NAME
                FROM
                    member
                ORDER BY
                    joindate DESC
            )
    )
WHERE
    rno BETWEEN 4 AND 6
;


INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '게시판 오픈', 1000, 
    '게시판 오픈 합니다. 많은 이용 부탁드립니다.'
);


INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '오픈 축하', 1001, 
    '게시판 오픈 축하드립니다.'
);

INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '오픈 축하', 1042, 
    '저도 게시판 오픈 축하드립니다.'
);


INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '저도 오픈 축하', 1025, 
    '게시판 오픈 축하드립니다.'
);

INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '아냐 축하!', 1043, 
    '아냐도 축하드립니다.'
);


INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '멍멍!', 1044, 
    '멍멍멍!'
);

INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '축하!', 1045, 
    '슈퍼 쏜~~~!'
);


INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '이지금도 축하!', 1046, 
    '감축드립니다.'
);

INSERT INTO
    fileboard(fbno, title, writer, body)
VALUES(
    fbrdseq.nextval, '축하합니다.', 1024, 
    '저도 축하합니다.'
);

commit;

SELECT
    rno, bno, title, body, mno, id, wdate
FROM
    (
        SELECT
            ROWNUM rno, bno, title, body, mno, id, wdate
        FROM
            (
                SELECT
                    fbno bno, title, body, mno, id, wdate
                FROM
                    fileboard f, member m
                WHERE
                    writer = mno
                    AND f.isshow = 'Y'
                ORDER BY
                    wdate DESC
            )
    )
WHERE
    rno BETWEEN 4 AND 6
;

/*
    1. 테이블에서 정렬해서 전체 조회
    2. 전체 조회 결과에 rownum 붙여주고
    3. 범위 지정해서 꺼내고
*/