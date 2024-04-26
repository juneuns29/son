INSERT INTO
    survey
VALUES(
    (SELECT NVL(MAX(svno) + 1, 1001) FROM survey),
    1001, 1001
);

-- 문항 리스트 조회
SELECT
    qno, qbody
FROM
    quest
WHERE
    qupno IS NULL
ORDER BY
    qno
;
-- 1001문항에 해당하는 보기 리스트 조회
SELECT
    qno, qbody
FROM
    quest
WHERE
    qupno = 1006
;

SELECT
    tpno, title, 
    CASE WHEN (sysdate BETWEEN startdate AND enddate) THEN 'OK'
    ELSE 'NO'
    END as ing
FROM
    topic, survey
WHERE
    tpno = stno
ORDER BY
	startdate DESC, enddate
;

INSERT INTO
    topic
VALUES(
    (SELECT NVL(MAX(tpno) + 1, 1001) FROM topic),
    '블랙핑크 멤버 선호도 조사', TO_DATE('2024/03/23'), TO_DATE('2024/04/01')
);

INSERT INTO
    topic
VALUES(
    (SELECT NVL(MAX(tpno) + 1, 1001) FROM topic),
    '게임 선호도 조사', TO_DATE('2024/02/01'), TO_DATE('2024/03/01')
);

COMMIT;

SELECT
    DECODE(COUNT(*), 0, 'NO', 'YES') result
FROM
    survey
WHERE
    stno = 1001
;
SELECT
    tpno, title, 
    CASE WHEN (sysdate BETWEEN startdate AND enddate) THEN 'OK'
    ELSE 'NO'
    END as ing,
    (
        SELECT
            COUNT(*)
        FROM
            survey
        WHERE
            stno = tpno
    ) cnt
FROM
    topic
ORDER BY
    startdate DESC, enddate
;
SELECT
    tpno, COUNT(stno) cnt
FROM
    survey, topic
WHERE
    tpno = stno(+)
GROUP BY
    tpno
;














