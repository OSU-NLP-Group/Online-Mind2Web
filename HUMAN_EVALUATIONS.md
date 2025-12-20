# Human Evaluations for Online Mind2Web

## Introduction

Human evaluation serves as the gold standard for assessing web agent performance on this benchmark. While automated evaluation methods such as WebJudge provide scalable and efficient assessment, human judgment remains essential for validating task completion, identifying nuanced failure modes, and ensuring fair comparisons across different agent submissions.

We require all submissions to include human evaluation results as part of the submission process. However, ensuring consistency and fairness across evaluations conducted by different submitters presents a significant challenge. Evaluator subjectivity, varying interpretation of task requirements, and inconsistent application of evaluation criteria can lead to biased or incomparable results.

To address these challenges and maintain the integrity of the benchmark, we have established standardized evaluation protocols and partnered with trusted third-party evaluation services. This document outlines the comprehensive evaluation framework, criteria, and processes that ensure rigorous, consistent, and fair human evaluation across all submissions.

## Evaluation Process

All human evaluations must follow this standardized process:

1. **Multi-Annotator Review**: Use at least **3 independent annotators plus 1 QA reviewer**. Each annotator evaluates trajectories independently, and the QA reviewer resolves disagreements and spot-checks edge cases.
2. **Trajectory Review**: Review the full trajectory including task description, action history, screenshots, and final response.
3. **Key Point Extraction**: Extract and verify all key points explicitly stated in the task description.
4. **Verification**: Verify each action and screenshot against those key points, checking filters/sorts, apply/submit clicks, and visible effects in results.
5. **Decision & Documentation**: Decide success/failure based on evaluation criteria; document the exact reason and failure point if failed.
6. **Recording**: Record the label (`0/1/2`) and maintain detailed reasoning traces for each evaluation.

### Submitter Options

Submitters have two options for conducting evaluations:

- **Option 1: Conduct Your Own Evaluation**: You may conduct evaluations yourself, but you must provide proof that all steps above were followed (including evidence of 3+ independent annotators, QA review, and detailed reasoning traces). Submissions may be subject to re-evaluation by benchmark maintainers to ensure consistency.

- **Option 2: Use Official Evaluation Partner** (Recommended): Use [Careerflow.ai](https://careerflow.ai/human-data) as our official trusted evaluation partner. Evaluations conducted through Careerflow automatically meet all process requirements and scores are accepted without additional review. See the [Official Evaluation Partner](#official-evaluation-partner) section for details.

## Evaluation Criteria

### Label Definitions

Each trajectory receives one of three labels:

- **`0` (Failure)**: The agent did not successfully complete the task. This includes cases where:
  - The agent failed to achieve the stated objective
  - Required filters or constraints were not properly applied
  - The agent took incorrect actions or navigated to wrong pages
  - The final result does not meet task requirements
  - The agent hallucinated intermediate steps or outcomes

- **`1` (Success)**: The agent successfully completed the task. This requires:
  - All key points from the task description were addressed
  - Required filters or constraints were correctly applied (if applicable)
  - The final outcome matches the task requirements
  - The trajectory demonstrates correct navigation and action execution

- **`2` (Not Executable)**: The agent was unable to execute the task due to external or system-related limitations beyond the agent's control. This includes:
  - Website accessibility issues (e.g., CAPTCHA blocking, site downtime)
  - Internal agent bugs preventing task execution
  - Website updates that invalidate the task during evaluation
  - System errors or infrastructure failures

### Specific Evaluation Guidelines

Evaluators must carefully apply the following criteria when assessing trajectories:

#### 1. Filter Application and Verification

- **Filter Correctness**: Filters must be properly applied and confirmed. Missing selection, missing confirmation, or no visible effect in results constitutes failure.
- **Filter Precision**: When tasks require specific ranges (e.g., price ranges, date ranges, numerical ranges), the applied filter must **exactly match** the requirement. Any deviation results in failure.
  - Example failures:
    - Requirement: "less than $50" → Applied: "less than $25" ❌
    - Requirement: "$1500-$2500" → Applied: "$2000-$2500" ❌
    - Requirement: "$25-$200" → Applied: "$0-$200" ❌
    - Requirement: "2004-2012" → Applied: "2001-2012" ❌
    - Requirement: "exactly 2 beds" → Applied: "2+ beds" ❌

#### 2. Sorting and Ranking Requirements

Tasks requiring "best," "highest," "cheapest," "latest," "most recent," "lowest," "closest," "highest-rated," "largest," or "newest" must use appropriate sorting/filtering functions. Simple search queries without proper sorting do not guarantee results meet the requirement and constitute failure.

#### 3. Requirement Application Method

Certain requirements must be applied through filters rather than search queries. A search with all requirements as input is deemed a failure if it cannot guarantee that all results meet the requirements.

#### 4. Submission and Display Requirements

Some tasks require a submission action or display of results to be considered successful. Evaluators must verify that the agent completed the full task flow, not just intermediate steps.

#### 5. Empty or Invalid Results

If the agent correctly performed all required actions but the retrieved information is invalid or empty (e.g., "No match was found"), the task should still be considered successful, as the agent executed the task correctly despite external data limitations.

#### 6. Pre-filtered Results

If the current page already displays all available items that meet requirements, applying additional filters may not be necessary. As long as the agent selects items that meet the requirements (e.g., the cheapest or lowest price), the task is considered successful.

#### 7. Hallucination Detection

Evaluators must identify cases where:
- The agent claims to have completed actions that are not reflected in the action history
- The final response contains information not present in the trajectory screenshots
- Intermediate steps are described but not actually executed

### Edge Cases and Failure Point Identification

When a trajectory fails, evaluators must identify:

1. **Failure Point**: The specific step in the trajectory where the agent deviated from the correct path
2. **Failure Type**: Categorization of the failure (e.g., incorrect filter application, wrong navigation, hallucination, incomplete task)
3. **Reasoning**: Detailed explanation of why the trajectory failed, referencing specific evaluation criteria

## Official Evaluation Partner

### Careerflow Human Data

To ensure consistent, high-quality evaluations across all submissions, **we have partnered with [Careerflow.ai](https://careerflow.ai/human-data) as the official trusted evaluation partner** for human evaluations.

Careerflow specializes in human evaluations, preference labeling, and expert annotations for benchmarking, RLHF, and supervised fine-tuning. With a network of over 1 million professionals, Careerflow provides:

- **Standardized Evaluation Process**: All evaluations follow the same rigorous multi-annotator protocol outlined in this document
- **Consistency Across Submissions**: Eliminates evaluator bias and ensures fair comparisons on the leaderboard
- **Expert Annotators**: Qualified evaluators trained specifically on web agent evaluation criteria
- **Quality Assurance**: Multi-layer QC processes ensure accuracy and reliability
- **Detailed Reporting**: Comprehensive failure reports and reasoning traces for each evaluation

### Benefits of Using the Official Partner

Submitters who use Careerflow for their human evaluations benefit from:

1. **Time Savings**: Eliminates the need for submitters to recruit, train, and manage evaluators
2. **Guaranteed Acceptance**: Evaluations conducted by the official partner are automatically accepted, eliminating the need for manual re-evaluation by benchmark maintainers
3. **Consistency**: All evaluations use the same criteria and process, ensuring fair leaderboard comparisons
4. **Transparency**: Detailed evaluation reports provide insights into agent performance and failure modes
5. **Reliability**: Multi-annotator consensus reduces individual evaluator bias

### Contact and Submission Process

For submissions requiring human evaluation, please contact Careerflow directly:

- **Website**: [careerflow.ai](https://careerflow.ai/human-data)
- **Evaluation Request**: Contact directly through the website or reach out to us for referral

**Note**: While submitters may conduct their own evaluations, the benchmark maintainers reserve the right to re-evaluate submissions using the official partner to ensure consistency and fairness. 

### Submission Requirements

When submitting evaluation results:

1. **Complete Coverage**: All 300 tasks in the benchmark must be evaluated
2. **Format Compliance**: Results must follow the exact JSON format specified above
3. **Label Justification**: Be prepared to provide reasoning for evaluations if requested by benchmark maintainers (not required when using the official Careerflow evaluation partner, as their reports already include full reasoning)
4. **Trajectory Data**: Ensure trajectory data (screenshots and action history) are available for review if needed

## Conclusion

Human evaluation is a critical component of this benchmark, ensuring fair and accurate assessment of web agent capabilities. By following the guidelines and processes outlined in this document, and leveraging the official evaluation partner when possible, submitters can ensure their evaluations meet the benchmark's rigorous standards.

For questions about the evaluation process or to request evaluation services through the official partner, please contact us or Careerflow directly.

