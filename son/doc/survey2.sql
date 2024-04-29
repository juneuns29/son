SELECT
    qno, qbody body, DECODE(qupno, NULL, 0, qupno) qupno
FROM
    survey, quest
WHERE
    qno = sqno
    AND stno = 1001
    AND qupno = 1001
ORDER BY
    qno
;

SELECT
    qno, qbody body, qupno
FROM
    survey, quest
WHERE
    qno = sqno
    AND stno = 1001
    AND qupno = 1001
ORDER BY
    qno
;