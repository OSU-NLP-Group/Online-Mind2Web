# Updating Tasks

We welcome updates to outdated or invalid tasks. A single issue may include multiple tasks.

## Propose task updates

1. Check the task against the [current dataset](https://huggingface.co/datasets/osunlp/Online-Mind2Web) to confirm that an update is needed.
2. Open a [task update issue](https://github.com/OSU-NLP-Group/Online-Mind2Web/issues/new?template=task_updates.yml), using a title such as `[Task Updates] Update outdated tasks`.
3. Fill out the issue form. For multiple tasks, repeat the task section using the format below.

We will review the proposed updates and publish accepted changes to the dataset.

## Task Update Format

The issue form includes the following fields. Repeat the task section for each task.

```markdown
## Dataset Version
The Hugging Face dataset revision (commit hash or tag) used for these updates.

## Task Updates

### Task ID: <task_id>

**Task:**
The original task description, copied exactly from the dataset.

**Reference Length:**
The number of actions in the original human reference trajectory.

**Feedback:**
Describe the issue you observed with the original task.
Explain how to reproduce it and include supporting screenshots or links.

**Updated Task:**
The proposed revised task description.
If no change is proposed, explicitly state “No change”.

**Updated Reference Length:**
The number of actions in the human reference trajectory for the updated task.
If you have not completed the updated task, write “Not verified”.

**Update Rationale:**
Explain why the task is revised in this specific way and how the changes
address the feedback. Clearly identify any changes to the original
requirements, such as the website, location, product, or time range.

**Reference History:**
List the actions you performed to complete the updated task, in order.
Include the verification date, observed result, and supporting screenshots.

---

<!-- Repeat the task section above for each additional task. -->
<!-- Review, Updated ID, and Status will be provided by maintainers for each task. -->
```

## Principle

We aim to avoid changing the website or the task itself as much as possible to ensure fair comparison with previous results (unless necessary, e.g., when the core functionality required by the task is removed from the website or when stronger CAPTCHA protections are introduced). We also try to keep the number of steps required to complete the updated task similar to the original one, so that the difficulty level remains similar.
