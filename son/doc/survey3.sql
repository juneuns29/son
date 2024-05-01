SELECT
    COUNT(*)
FROM
    survey, surveyanswer
WHERE
    ssno = svno
    AND sa_id = 'jennie'
    AND stno = 1001
;

SELECT
    COUNT(distinct sa_id)
FROM
    survey, surveyanswer
WHERE
    ssno = svno
    AND stno = 1001
;

-- qno : 1002 인 보기의 응답율
SELECT
    ROUND(COUNT(sa_id) / totalcnt * 100, 2) per
FROM
    surveyanswer, survey,
    (
        SELECT
            COUNT(distinct sa_id) totalcnt
        FROM
            survey, surveyanswer
        WHERE
            ssno = svno
            AND stno = 1001
    )
WHERE
    svno = ssno(+)
    AND stno = 1001
    AND sqno = 1008
GROUP BY
    totalcnt
;

SELECT
    sqno, count(sa_id), ROUND(COUNT(sa_id) / totalcnt * 100, 2) per
FROM
    survey, quest, surveyAnswer,
    (
        SELECT
            COUNT(distinct sa_id) totalcnt
        FROM
            survey, surveyanswer
        WHERE
            ssno = svno
            AND stno = 1001
    )
WHERE
    qno = sqno
    AND svno = ssno(+)
    AND stno = 1001
    AND qupno IS NOT NULL
GROUP BY
    sqno, totalcnt
HAVING
    sqno = 1003
ORDER BY
    sqno
;

