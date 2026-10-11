# Meal-quality-v1

This is a general, estimated **meal** score, not a person's health score, medical assessment, personalized-diet rating or Cal AI's proprietary formula.

## Anchors
| Score | Evidence-supported interpretation |
|---|---|
| 1–2 | Very limited nutritional variety, with supported reasons |
| 3–4 | Limited balance, few nutrient-dense components |
| 5–6 | Some useful nutrient sources, opportunities for balance |
| 7–8 | Complementary protein and plant/whole-grain components |
| 9–10 | Varied, well-balanced nutrient-dense components for this eating occasion |

Anchors are applied in context, not as mandatory ingredient counts. A fruit, nuts or yogurt snack may score highly without complete-meal balance. Consider ingredient variety, protein sources, vegetables, fruit, legumes and whole grains. Reliable supplied fiber may support the assessment; unknown fiber is not zero. Added sugar, saturated fat and salt affect the assessment only with supporting ingredient or nutrition evidence and realistic portions. Total sugar is not added sugar.

Never penalize calories alone. Do not infer hidden oil, sugar, salt or processing with certainty from a photo. Unknown information is not evidence of low quality. Confidence (low/medium/high) describes evidence reliability separately; blurry images do not automatically receive lower scores. Return null if identified foods are too ambiguous to assess.

All paths share the prompt exported from `src/lib/meal-score-rubric.server.ts` and validate the same result. AI judgement can vary slightly even with identical anchors; this is an estimate, not a clinical or deterministic laboratory measurement. Record the rubric version with each saved assessment. A future rubric change must use a new version.

Scores are saved with their input fingerprint. Reopening never requests AI; ingredient, portion, meal context or nutrition edits invalidate the prior score. Recalculation failures do not stop meal logging. Existing meals are not silently backfilled. Scoring calls use workspace AI credits; photo scan quota behavior is unchanged.